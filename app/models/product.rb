class Product < ApplicationRecord

    has_one_attached :primary_image
    has_many_attached :supporting_images
    has_many :orders
    belongs_to :category
    validate :no_negative_stock

    def no_negative_stock
        if stock.negative?
            errors.add(:title, 'stock must be positive integer')
        end
    end
end
