class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :item_condition
  belongs_to :category

  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'should be half-width numbers' }
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end