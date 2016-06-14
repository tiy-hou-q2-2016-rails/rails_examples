class ProductsController < ApplicationController

  # Don't write initialize in rails
  # def initialize
  #   @product_name = 'jwo rules'
  # end

  def list
    @products = product_list
  end

  def detail
    @products = product_list
    @product = @products.find {|p| p.parameterize == params[:id]}
    render_404 if @product.nil?
  end

  def product_list
    [
      'bike',
      'helmet',
      'Large Burritos'
    ]
  end

end
