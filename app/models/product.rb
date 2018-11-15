class Product < ApplicationRecord


  has_one :category
  has_many :product_comments

  validates :name, presence: true,
            length: { maximum: 50}
  validates :price, presence: true,
            numericality: true
  validates :stock, presence: true,
            numericality: true
  validates :category, presence: true
  validates :description, presence: true,
            length: {maximum: 200}
end

