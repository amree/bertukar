require 'spec_helper'

describe Admin::MinistriesController do

  # This should return the minimal set of attributes required to create a valid
  # Ministry. As you add validations to Ministry, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.build(:ministry).attributes
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MinistriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all ministries as @ministries" do
      ministry = Ministry.create! valid_attributes
      get :index, {}, valid_session
      assigns(:ministries).should eq([ministry])
    end
  end

  describe "GET show" do
    it "assigns the requested ministry as @ministry" do
      ministry = Ministry.create! valid_attributes
      get :show, {:id => ministry.to_param}, valid_session
      assigns(:ministry).should eq(ministry)
    end
  end

  describe "GET new" do
    it "assigns a new ministry as @ministry" do
      get :new, {}, valid_session
      assigns(:ministry).should be_a_new(Ministry)
    end
  end

  describe "GET edit" do
    it "assigns the requested ministry as @ministry" do
      ministry = Ministry.create! valid_attributes
      get :edit, {:id => ministry.to_param}, valid_session
      assigns(:ministry).should eq(ministry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ministry" do
        expect {
          post :create, {:ministry => valid_attributes}, valid_session
        }.to change(Ministry, :count).by(1)
      end

      it "assigns a newly created ministry as @ministry" do
        post :create, {:ministry => valid_attributes}, valid_session
        assigns(:ministry).should be_a(Ministry)
        assigns(:ministry).should be_persisted
      end

      it "redirects to the created ministry" do
        post :create, {:ministry => valid_attributes}, valid_session
        response.should redirect_to([:admin, Ministry.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ministry as @ministry" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ministry.any_instance.stub(:save).and_return(false)
        post :create, {:ministry => {}}, valid_session
        assigns(:ministry).should be_a_new(Ministry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ministry.any_instance.stub(:save).and_return(false)
        post :create, {:ministry => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ministry" do
        current_valid_attr = valid_attributes
        ministry = Ministry.create! current_valid_attr
        # Assuming there are no other ministries in the database, this
        # specifies that the Ministry created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Ministry.any_instance.should_receive(:update_attributes).with(paramify_values(current_valid_attr))
        put :update, {:id => ministry.to_param, :ministry => current_valid_attr}, valid_session
      end

      it "assigns the requested ministry as @ministry" do
        ministry = Ministry.create! valid_attributes
        put :update, {:id => ministry.to_param, :ministry => valid_attributes}, valid_session
        assigns(:ministry).should eq(ministry)
      end

      it "redirects to the ministry" do
        ministry = Ministry.create! valid_attributes
        put :update, {:id => ministry.to_param, :ministry => valid_attributes}, valid_session
        response.should redirect_to([:admin, ministry])
      end
    end

    describe "with invalid params" do
      it "assigns the ministry as @ministry" do
        ministry = Ministry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ministry.any_instance.stub(:save).and_return(false)
        put :update, {:id => ministry.to_param, :ministry => {}}, valid_session
        assigns(:ministry).should eq(ministry)
      end

      it "re-renders the 'edit' template" do
        ministry = Ministry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ministry.any_instance.stub(:save).and_return(false)
        put :update, {:id => ministry.to_param, :ministry => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ministry" do
      ministry = Ministry.create! valid_attributes
      expect {
        delete :destroy, {:id => ministry.to_param}, valid_session
      }.to change(Ministry, :count).by(-1)
    end

    it "redirects to the ministries list" do
      ministry = Ministry.create! valid_attributes
      delete :destroy, {:id => ministry.to_param}, valid_session
      response.should redirect_to(admin_ministries_url)
    end
  end

end
