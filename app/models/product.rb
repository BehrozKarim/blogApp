class Product < ApplicationRecord
    belongs_to :user
    validates :price, numericality: { greater_than: 0.0 }
    validates :quantity, numericality: { greater_than: 0 }

end
