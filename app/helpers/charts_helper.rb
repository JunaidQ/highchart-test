module ChartsHelper
    def eth_date_format
    eth = @eth_data_array[0][0]
    eday = eth[8,2]
    emonth = eth[5,2]
    eyear = eth[0,4]
    return eday.to_i, emonth.to_i, eyear.to_i
  end

  def bitcoin_date
    start_point = @data_array[0][0]
    bday = start_point[8,2]
    bmonth = start_point[5,2]
    byear = start_point[0,4]
    return bday.to_i, bmonth.to_i, byear.to_i
  end
end
