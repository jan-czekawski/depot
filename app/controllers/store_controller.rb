class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    session[:counter] += 1 unless session[:counter].nil?
    session[:counter] = 1 if session[:counter].nil?
  end
end
