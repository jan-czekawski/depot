class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    session[:counter] += 1 unless session[:counter].nil?
    session[:counter] = 1 if session[:counter].nil?
  end
end
