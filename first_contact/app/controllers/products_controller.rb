class ProductsController < ApplicationController

  # Don't write initialize in rails
  # def initialize
  #   @product_name = 'jwo rules'
  # end

  def valid_product_names
    [
      'bike',
      'helmet'
    ]
  end

  def detail
    # because @product_name is an instance variable, it's available in your views
    # @product_name = 'jwo rules'

    # verify product name is either bike or helmet

      # check the id
      id = params[:id]
      @product_name = valid_product_names.find {|p| p == id}
      if @product_name.present?
        # we're good!
      else
        render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
      end
    # if not, raise 'hell'


  end
end
