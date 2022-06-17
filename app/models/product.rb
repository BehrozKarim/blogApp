class Product < ApplicationRecord
    belongs_to :user
    validates :price, numericality: { greater_than: 0 }
    validates :quantity, numericality: { greater_than: 0 }
    validates :name, length: { minimum: 2 }
    after_create :after_function
    after_save :after_function, if: :saved_change_to_name?

    def after_function
        puts "Name of Product is #{self.name}"*100
    end
end
