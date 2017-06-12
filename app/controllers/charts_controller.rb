class ChartsController < ApplicationController
  include ChartsHelper
  require 'net/http'
  require 'json'
  require 'coinbase/wallet'
 
  def index
    bitcoin
    ethereum
  end

  def bitcoin
    client = Coinbase::Wallet::Client.new(api_key: ENV['APIKEY'], api_secret: ENV['APISECRET'])

    @data_array = []
    rate_usd = []

    CURRENCY_DATE.each do |date|
      rate_usd << client.spot_price({currency: 'USD', date: date})  
    end
    
    @data_array = rate_usd.each_with_index.map{ |value,index|[DateTime.parse(CURRENCY_DATE[index]).strftime("%Y-%m-%d"),value['amount'].to_f] }
    @data = rate_usd.each_with_index.map{ |value,index| value['amount'].to_f }

    gon.data = @data
    respond_to do |format|
      format.html
      format.js
    end
  end

  def ethereum
    url = 'https://etherchain.org/api/statistics/price'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_data = JSON.parse(response)
    eth_data = []
    
    response_data["data"].each do |f|
      time = Time.parse(f["time"])
      date = Date.parse(f["time"])

      if date.month == 8 && date.day.between?(3,9) && time.hour == 5 
        eth_data << f 
      end
    end

    @eth_data_array = eth_data.map{|x| [x["time"],x["usd"]] }
    @eth_array = eth_data.map{|x| x["usd"] }
    gon.eth_data = @eth_array

    respond_to do |format|
      format.html
      format.js
    end
  end

end
