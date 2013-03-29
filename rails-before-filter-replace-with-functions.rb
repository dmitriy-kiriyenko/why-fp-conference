class OrderController < ApplicationController
  before_filter :authenticate_user!

  def new
    @order = order
  end

  def create
    @order = refreshed_order
    @order.save
    respond_with(@order)
  end

  def edit
    @order = order
  end

  def update
    @order = refreshed_order
    @order.save
    respond_with(@order)
  end

  def destroy
    @order = order
    @order.destroy
    respond_with(@order)
  end

  private

  def order
    params[:id] ? (ensure_access! Order.find(params[:id])) : Order.new
  end

  def resfreshed_order
    order.tap { |o| o.attributes = params[:order] }
  end

  def ensure_access!(order)
    current_user.can_edit?(order) ? order : permission_denied! 
  end
end
