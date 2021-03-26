class Product < ApplicationRecord

    belongs_to :category
    validate :no_negative_stock

    def no_negative_stock
        if stock.negative?
            errors.add(:title, 'stock must be positive integer')
        end
    end
end
