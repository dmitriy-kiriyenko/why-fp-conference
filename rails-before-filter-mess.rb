class OrderController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_order, only: [:edit, :update, :destroy]
  before_filter :create_order_from_params, only: [:new, :create]
  before_filter :authorize_user_on_order!, only: [:edit, :update, :destroy]
  before_filter :update_order_from_params, only: [:update]
  before_filter :render_if_save_error, only: [:create, :update]

  def new;  end
  def edit;  end

  def create
    redirect_to success_url
  end

  def update
    redirect_to @order
  end

  def destroy
    @order.destroy
    redirect_to success_url
  end

  def load_order
    @order = Order.find params[:id]
  end

  def create_order_from_params
    @order = Order.new params[:order]
  end

  def authorize_user_on_order!
    permission_denied! unless current_user.can_edit? @order
  end

  def update_order_from_params
    @order.update_attributes
  end

  def render_if_save_error
    unless @order.valid?
      render 'error' and return false
    end
  end
end
