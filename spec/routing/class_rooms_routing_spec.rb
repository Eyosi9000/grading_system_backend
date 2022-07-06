require "rails_helper"

RSpec.describe ClassRoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/class_rooms").to route_to("class_rooms#index")
    end

    it "routes to #show" do
      expect(get: "/class_rooms/1").to route_to("class_rooms#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/class_rooms").to route_to("class_rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/class_rooms/1").to route_to("class_rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/class_rooms/1").to route_to("class_rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/class_rooms/1").to route_to("class_rooms#destroy", id: "1")
    end
  end
end
