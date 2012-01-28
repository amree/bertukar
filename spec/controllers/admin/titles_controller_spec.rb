require 'spec_helper'

describe Admin::TitlesController, focus: true do

  # This should return the minimal set of attributes required to create a valid
  # Title As you add validations to Title, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.build(:title).attributes
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TitlesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all admin_titles as @admin_titles" do
      title = Title.create! valid_attributes
      get :index, {}, valid_session
      assigns(:titles).should eq([title])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_title as @admin_title" do
      title = Title.create! valid_attributes
      get :show, {:id => title.to_param}, valid_session
      assigns(:title).should eq(title)
    end
  end

  describe "GET new" do
    it "assigns a new admin_title as @admin_title" do
      get :new, {}, valid_session
      assigns(:title).should be_a_new(Title)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_title as @admin_title" do
      title = Title.create! valid_attributes
      get :edit, {:id => title.to_param}, valid_session
      assigns(:title).should eq(title)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Title" do
        expect {
          post :create, {:title => valid_attributes}, valid_session
        }.to change(Title, :count).by(1)
      end

      it "assigns a newly created admin_title as @admin_title" do
        post :create, {:title => valid_attributes}, valid_session
        assigns(:title).should be_a(Title)
        assigns(:title).should be_persisted
      end

      it "redirects to the created admin_title" do
        post :create, {:title => valid_attributes}, valid_session
        response.should redirect_to([:admin, Title.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_title as @admin_title" do
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        post :create, {:title => {}}, valid_session
        assigns(:title).should be_a_new(Title)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        post :create, {:title => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_title" do
        current_valid_attr = valid_attributes
        title = Title.create! current_valid_attr
        # Assuming there are no other admin_titles in the database, this
        # specifies that the Title created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Title.any_instance.should_receive(:update_attributes).with(paramify_values(current_valid_attr))
        put :update, {:id => title.to_param, :title => current_valid_attr}, valid_session
      end

      it "assigns the requested admin_title as @admin_title" do
        title = Title.create! valid_attributes
        put :update, {:id => title.to_param, :title => valid_attributes}, valid_session
        assigns(:title).should eq(title)
      end

      it "redirects to the admin_title" do
        title = Title.create! valid_attributes
        put :update, {:id => title.to_param, :title => valid_attributes}, valid_session
        response.should redirect_to([:admin, title])
      end
    end

    describe "with invalid params" do
      it "assigns the admin_title as @admin_title" do
        title = Title.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        put :update, {:id => title.to_param, :title => {}}, valid_session
        assigns(:title).should eq(title)
      end

      it "re-renders the 'edit' template" do
        title = Title.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Title.any_instance.stub(:save).and_return(false)
        put :update, {:id => title.to_param, :title => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_title" do
      title = Title.create! valid_attributes
      expect {
        delete :destroy, {:id => title.to_param}, valid_session
      }.to change(Title, :count).by(-1)
    end

    it "redirects to the admin_titles list" do
      title = Title.create! valid_attributes
      delete :destroy, {:id => title.to_param}, valid_session
      response.should redirect_to(admin_titles_url)
    end
  end

end
