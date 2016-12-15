class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :sales
  has_many :buyers, through: :sales, source: :user
  validates :product, length: {minimum:2}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to:0}
end
