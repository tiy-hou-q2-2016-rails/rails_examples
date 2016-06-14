class ProductsController < ApplicationController

  class Product
    attr_accessor :name, :price, :description, :inventory

  end

  # Don't write initialize in rails
  # def initialize
  #   @product_name = 'jwo rules'
  # end

  def list
    @products = product_list
  end

  def detail
    @products = product_list
    @product = @products.find {|p| p.name.parameterize == params[:id]}
    render_404 if @product.nil?
  end

  def product_list
    # [
    #   'bike',
    #   'helmet',
    #   'Large Burritos'
    # ]

    list = []
    bike = Product.new
    bike.name = "Bike"
    bike.inventory = 1
    bike.price = 700
    bike.description = "😟😟😟Oh the places you'll go. Like the garage. It will sit in your garage. 😟😟😟"

    list << bike

    waffle = Product.new
    waffle.name = "Waffle"
    waffle.inventory = 5
    waffle.price = 3
    waffle.description = "Give me all the waffles you have. I want to make sure you heard me. I did not say Bring Me a Lot of Waffles. I said bring me all the waffles you have."

    list << waffle

    snorkle = Product.new
    snorkle.name = "Snorkle"
    snorkle.inventory = 10
    snorkle.price = 6
    snorkle.description = "Extreme waffle accessory. Syrup not included"

    list << snorkle

    return list
  end

end
