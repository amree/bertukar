require 'spec_helper'

describe Admin::LocationsController do

  # This should return the minimal set of attributes required to create a valid
  # Location. As you add validations to Location, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.build(:location).attributes
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LocationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all admin_locations as @locations" do
      location = Location.create! valid_attributes
      get :index, {}, valid_session
      assigns(:locations).should eq([location])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_location as @location" do
      location = Location.create! valid_attributes
      get :show, {:id => location.to_param}, valid_session
      assigns(:location).should eq(location)
    end
  end

  describe "GET new" do
    it "assigns a new admin_location as @location" do
      get :new, {}, valid_session
      assigns(:location).should be_a_new(Location)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_location as @location" do
      location = Location.create! valid_attributes
      get :edit, {:id => location.to_param}, valid_session
      assigns(:location).should eq(location)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, {:location => valid_attributes}, valid_session
        }.to change(Location, :count).by(1)
      end

      it "assigns a newly created admin_location as @location" do
        post :create, {:location => valid_attributes}, valid_session
        assigns(:location).should be_a(Location)
        assigns(:location).should be_persisted
      end

      it "redirects to the created admin_location" do
        post :create, {:location => valid_attributes}, valid_session
        response.should redirect_to([:admin, Location.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_location as @location" do
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        post :create, {:location => {}}, valid_session
        assigns(:location).should be_a_new(Location)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        post :create, {:location => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_location" do
        current_valid_attr = valid_attributes
        location = Location.create! current_valid_attr
        # Assuming there are no other admin_locations in the database, this
        # specifies that the Location created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Location.any_instance.should_receive(:update_attributes).with(paramify_values(current_valid_attr))
        put :update, {:id => location.to_param, :location => current_valid_attr}, valid_session
      end

      it "assigns the requested admin_location as @location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        assigns(:location).should eq(location)
      end

      it "redirects to the admin_location" do
        location = Location.create! valid_attributes
        put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
        response.should redirect_to([:admin, location])
      end
    end

    describe "with invalid params" do
      it "assigns the admin_location as @location" do
        location = Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :location => {}}, valid_session
        assigns(:location).should eq(location)
      end

      it "re-renders the 'edit' template" do
        location = Location.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Location.any_instance.stub(:save).and_return(false)
        put :update, {:id => location.to_param, :location => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, {:id => location.to_param}, valid_session
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the admin_locations list" do
      location = Location.create! valid_attributes
      delete :destroy, {:id => location.to_param}, valid_session
      response.should redirect_to(admin_locations_url)
    end
  end

end
