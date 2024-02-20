class ShopAddressesController < ApplicationController
  def index
    @shop= ShopAddress.all
    
  end
end
