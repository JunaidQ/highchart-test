require "rails_helper"

RSpec.describe "charts/bitcoin" do
  
  describe " " do
    it "matches the template" do
      render :template => "charts/bitcoin.html.erb"
      expect(rendered).to match /bit/
    end


  end

end