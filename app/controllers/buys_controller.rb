class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.sold_out?
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @buy_residence = BuyResidence.new
    end
  end

  def create
    @buy_residence = BuyResidence.new(buy_residence_params)

    if @buy_residence.valid?
      pay_item
      @buy_residence.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_residence_params
    params.require(:buy_residence).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :telephone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: buy_residence_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end