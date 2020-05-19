class Product < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :categories, through: :inventories
  after_create :save_categories

   def categories=(value)
    @categories = value
   end

   private
    def save_categories
      @categories.each do |category_id|
        Inventory.create(category_id: category_id, product_id: self.id)
      end
    end
end
