class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # before_action :authenticate_user!, except: [:index, :show ]

  def index
    @items = Item.order("created_at DESC")
	end

  def new                                                                                                                                  
  @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @item = Item.find(params[:id])
  if @item.user_id != current_user.id
    redirect_to root_path
  end
end


def update
  # @item = Item.edit(item_params)
  @item = Item.find(params[:id])  
  # if @item.update(item_params)
  #   redirect_to root_path
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit, status: :unprocessable_entity
  end
end


private

def item_params
  params.require(:item).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, :burden_of_shipping_charges_id, :prefecture_id, :number_of_days_until_shipping_id, :selling_price).merge(user_id: current_user.id)
end


end