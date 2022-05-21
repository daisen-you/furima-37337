class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @purchases_buyers = PurchasesBuyers.new
  end

  def new
  end

  def create
    @purchases_buyers = PurchasesBuyers.new(purchases_params)
    if @purchases_buyers.valid?
      pay_item
      @purchases_buyers.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchases_params
    params.require(:purchases_buyers).permit( :post_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_9084d08c4f23aeb16ead8926"
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchases_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end
end
