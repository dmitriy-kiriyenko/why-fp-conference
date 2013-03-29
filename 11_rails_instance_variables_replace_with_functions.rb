class OrderController < ApplicationController
  before_filter :authenticate_user!
  helper_method :order

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

  private

  def order
    @_order ||= refresh(params[:id] ? (ensure_access! Order.find(params[:id])) : Order.new)
  end

  def resfresh(order)
    order.tap { |o| o.attributes = params[:order] if params[:order] }
  end

  def ensure_access!(order)
    current_user.can_edit?(order) ? order : permission_denied! 
  end
end
