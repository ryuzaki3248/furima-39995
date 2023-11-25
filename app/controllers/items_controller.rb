class ItemsController < ApplicationController
  def index
    # @items = Item.all
	end

 def new
  @item = Item.new
 end



def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end


private

def item_params
  binding.pry
  params.require(:item).permit(:image, :product_name, :category_id, :product_condition_id, :burden_of_shipping_charges_id, :prefecture_id, :number_of_days_until_shipping_id, :selling_price).merge(user_id: current_user.id)
end







end