class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_me
  before_action :sold_out

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def redirect_to_me
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end

  def sold_out
    item = Item.find(params[:item_id])
    sold_out = item.orders
    redirect_to root_path if sold_out.present?
  end
end
