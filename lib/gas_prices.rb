require 'net/http'
require 'uri' 

class GasPrices
     
     def get_gas_price()
       uri = URI("http://devapi.mygasfeed.com/stations/radius/40.7608333/-111.8902778/10/reg/price/rfej9napna.json?callback=?")
       data = Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        end
        ipinfo = JSON.parse(data.body)
      end


end