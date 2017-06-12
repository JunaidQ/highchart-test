require "rails_helper"

RSpec.describe "charts/ethereum" do

  describe " " do
    it "matches the template" do
      render :template => "charts/ethereum.html.erb"
      expect(rendered).to match /eth/

    end
  end

end