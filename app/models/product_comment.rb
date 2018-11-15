class ProductComment < ApplicationRecord

  belongs_to :product

  validates :comment, length: {maximum: 140},
            presence: true

end
