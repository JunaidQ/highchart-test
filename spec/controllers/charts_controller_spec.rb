require "rails_helper"
RSpec.describe ChartsController, type: :controller do
    
  describe "#index" do
    before do
    end

    it "responds successfully" do
      get :index
      expect(response.status).to eq(200)
      expect { get :index, :format => :html }.to_not raise_error
    end
  end

  describe "#ethereum" do
    it "responds successfully" do
      get :ethereum
      expect(response.status).to eq(200)
      expect { get :ethereum, :format => :html }.to_not raise_error
    end
  end

  describe "#bitcoin" do
    it "responds successfully" do
      get :bitcoin
      expect(response.status).to eq(200)
      expect { get :bitcoin, :format => :html }.to_not raise_error
      # binding.pry
    end
  end


end