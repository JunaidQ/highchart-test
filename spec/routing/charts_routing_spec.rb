require "rails_helper"

RSpec.describe "routes for Charts", :type => :routing do
  
  it "routes / to the charts controller" do
    expect(get("/")).to route_to("charts#index")
  end
  
  it "routes /index to the charts controller" do
    expect(get("/")).to route_to("charts#index")
  end
  
  it "routes /eth to the charts controller" do
    expect(get("/eth")).to route_to("charts#ethereum")
  end
  
  it "routes /bit to the charts controller" do
    expect(get("/bit")).to route_to("charts#bitcoin")
  end

end
