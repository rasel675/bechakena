require 'net/http'

class SearchShop
  def initialize(search_params)
    @search_params= search_params
  end

  def call

  end

  def search
    uri = URI('http://localhost:3000/shop_addresses')
    params = {country: @search_params }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)

  end
 
end