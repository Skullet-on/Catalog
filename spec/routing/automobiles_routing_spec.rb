require "rails_helper"

RSpec.describe AutomobilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/automobiles").to route_to("automobiles#index")
    end

    it "routes to #new" do
      expect(:get => "/automobiles/new").to route_to("automobiles#new")
    end

    it "routes to #show" do
      expect(:get => "/automobiles/1").to route_to("automobiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/automobiles/1/edit").to route_to("automobiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/automobiles").to route_to("automobiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/automobiles/1").to route_to("automobiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/automobiles/1").to route_to("automobiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/automobiles/1").to route_to("automobiles#destroy", :id => "1")
    end

  end
end
