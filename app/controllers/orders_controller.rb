class OrdersController < ApplicationController
before_action :authenticate_user!  
before_action :redirect
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  
        card: order_params[:token],    
        currency: 'jpy'            
      )
      @order_address.save
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def redirect
    item = Item.find(params[:item_id])
    id = item.orders
      if id.present?
       redirect_to root_path
      end
  end
end