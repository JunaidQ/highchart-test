require "rails_helper"

RSpec.describe "charts/index" do

  describe " " do
    it "matches the template" do
      render :template => "charts/index.html.erb"
      expect(rendered).to match /eth/
    end
  end

end