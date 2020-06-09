class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  # accepts_nested_attributes_for :categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      if category_attribute[:name] != ""
        category = Category.find_or_create_by(category_attribute)
        if !self.categories.include?(category) 
          self.categories << category
        end
      end
    end 
  end 

end
