require "spec_helper"

describe InteractionsController do
  describe "routing" do

    it "routes to #index" do
      get("/interactions").should route_to("interactions#index")
    end

  end
end
