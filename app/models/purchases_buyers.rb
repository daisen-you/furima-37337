class PurchasesBuyers
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :address, :building_name, :phone_number, :prefecture_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address, :city
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Buyer.create(purchase_id: purchase.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end






