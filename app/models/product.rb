class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :photo, PhotoUploader

  def self.search(keyword)
    Product.where('name LIKE ?', "%#{keyword}%")
  end
end