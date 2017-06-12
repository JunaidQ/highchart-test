class ChartsController < ApplicationController
  include ChartsHelper
  require 'net/http'
  require 'json'
  require 'coinbase/wallet'
 
  def index
    bitcoin
    ethereum
    # binding.pry
  end

  def bitcoin
    client = Coinbase::Wallet::Client.new(api_key: '51xT9CrkutVJOaA1', api_secret: 'Eb3f67B21qqwJiyTYvxWuFcZqN7TyxfH')
    price = client.spot_price({currency_pair: 'BTC-USD'})
    currencies = client.currencies

    @data_array = []
    rate_usd = []
    usd_date = ['2017-06-02(UTC)','2017-06-03(UTC)','2017-06-04(UTC)','2017-06-05(UTC)',
      '2017-06-06(UTC)','2017-06-07(UTC)','2017-06-08(UTC)']

    usd_date.each do |date|
      rate_usd << client.spot_price({currency: 'USD', date: date})  
    end
    
    @data_array = rate_usd.each_with_index.map{ |value,index|[DateTime.parse(usd_date[index]).strftime("%Y-%m-%d"),value['amount'].to_f] }
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
    a = JSON.parse(response)
    eth_data = []
    
    a["data"].each do |f|
      t = Time.parse(f["time"])
      d = Date.parse(f["time"])

      if d.month == 8 && d.day.between?(3,9) && t.hour == 5 
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
