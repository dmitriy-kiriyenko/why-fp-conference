class OrderController < ApplicationController
  before_filter :authenticate_user!

  def new; end
  def edit; end

  def create
    order.save
    respond_with(order)
  end

  def update
    order.save
    respond_with(order)
  end

  def destroy
    order.destroy
    respond_with(order)
  end

  expose(:order) {
    refresh(params[:id] ? (ensure_access! Order.find(params[:id])) : Order.new)
  }

  private

  def resfresh(order)
    order.tap { |o| o.attributes = params[:order] if params[:order] }
  end

  def ensure_access!(order)
    current_user.can_edit?(order) ? order : permission_denied! 
  end
end
