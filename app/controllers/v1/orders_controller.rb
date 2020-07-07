class V1::OrdersController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_order, only: [:update]

  def index
    @orders = Order.where(school_id: params[:school_id])
  end

  def create
    @order = Order.new(order_params)
    @order.status = "ORDER_RECEIVED"

    if @order.save
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def cancel
    @order = Order.find(params[:order_id])

    if @order.update(status: "ORDER_CANCELLED")
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def ship
    @order = Order.find(params[:order_id])

    if @order.update(status: "ORDER_SHIPPED")
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:school_id, :recipient_ids => [], :gift_ids => [])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
