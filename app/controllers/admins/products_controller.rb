class Admins::ProductsController < ApplicationController

  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:index, :show]

  # GET /products or /products.json
  def index
    @products = Product.all.where(status: "public")
    respond_to do |format|
      format.html
      format.csv {send_data generate_csv(Product.all), file_name: 'products.csv'}
    end
  end

  def delete_image_attachment
    @space_image = ActiveStorage::Attachment.find(params[:id])
    @space_image.purge
    redirect_back(fallback_location: request.referer)
  end

  def csv_upload
    data = params[:csv_file].read.split("\n")
    data.each do |line|
      attr = line.split(",").map(&:strip)
      p = Product.new
      p.title = attr[0]
      p.description = attr[1]
      p.stock = attr[2]
      p.category_id = 0
      p.status = "public"
      p.save
    end
    redirect_to root_path
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.invalid?
      flash[:error] = @products.errors.objects.first.full_message
    end
    if @product.save
      flash[:success] = "Product created"
    end

    redirect_to action: :index
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.category_id = params[:category_id]
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admins_product_path(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :stock, :status, :primary_image, :supporting_images=>[])
    end

  def generate_csv(products)
    products.map do |product|
      [product.title, product.description ,product.stock, Category.find(product.category_id).name].join(',')
    end.join("\n")
  end



end
