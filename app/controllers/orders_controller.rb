class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find 
  before_action :redirect_to_me
  before_action :sold_out
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      card_check
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

  def item_find
    @item = Item.find(params[:item_id])
  end
  
  def redirect_to_me
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out
    sold_out = @item.orders
    redirect_to root_path if sold_out.present?
  end


  def card_check
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
