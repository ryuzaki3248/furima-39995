class BuysController < ApplicationController
	before_action :authenticate_user!, except: :index

	def index
    @buy_residence = BuyResidence.new
		@item = Item.find(params[:item_id])
	 end

  def create
    @buy_residence = BuyResidence.new(buy_residence_params)
		@item = Item.find(params[:item_id])
    # @current_item = find_current_item

    if @buy_residence.valid?
			# @buy_residence.item = @current_item
      @buy_residence.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


	

  private

	# def buy_params
	# 	params.require(:buy_residence).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: current_item.id)
	# end

	# def buy_residence_params
	# 	params.require(:buy_residence).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :item_id).merge(user_id: current_user.id)
	# end

	def buy_residence_params
		params.require(:buy_residence).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
	end

end

