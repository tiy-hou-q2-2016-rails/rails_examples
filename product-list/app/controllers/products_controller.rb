require 'csv'

class ProductsController < ApplicationController

  class Product
    attr_accessor :id, :name, :description, :image, :price, :category
  end

  def index
    @products = fetch_products
  end

  def show
    @products = fetch_products

    @product = @products.find {|p| p.id == params[:id]}
  end

  def fetch_products
    products = []

    CSV.foreach("#{Rails.root}/products.csv", headers: true) do |row|
      product_hash = row.to_hash
      product = Product.new
      product.id = product_hash['id']
      product.name = product_hash['name']
      product.description = product_hash['description']
      product.image = product_hash['image']
      product.price = product_hash['price'].to_f
      product.category = product_hash['category']

      products << product
    end

    products.sort_by {|p| p.price }

  end
end
