require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MedicationsController do

  # This should return the minimal set of attributes required to create a valid
  # Medication. As you add validations to Medication, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nui" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MedicationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all medications as @medications" do
      medication = Medication.create! valid_attributes
      get :index, {}, valid_session
      assigns(:medications).should eq([medication])
    end
  end

  describe "GET show" do
    it "assigns the requested medication as @medication" do
      medication = Medication.create! valid_attributes
      get :show, {:id => medication.to_param}, valid_session
      assigns(:medication).should eq(medication)
    end
  end

  describe "GET new" do
    it "assigns a new medication as @medication" do
      get :new, {}, valid_session
      assigns(:medication).should be_a_new(Medication)
    end
  end

  describe "GET edit" do
    it "assigns the requested medication as @medication" do
      medication = Medication.create! valid_attributes
      get :edit, {:id => medication.to_param}, valid_session
      assigns(:medication).should eq(medication)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Medication" do
        expect {
          post :create, {:medication => valid_attributes}, valid_session
        }.to change(Medication, :count).by(1)
      end

      it "assigns a newly created medication as @medication" do
        post :create, {:medication => valid_attributes}, valid_session
        assigns(:medication).should be_a(Medication)
        assigns(:medication).should be_persisted
      end

      it "redirects to the created medication" do
        post :create, {:medication => valid_attributes}, valid_session
        response.should redirect_to(Medication.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved medication as @medication" do
        # Trigger the behavior that occurs when invalid params are submitted
        Medication.any_instance.stub(:save).and_return(false)
        post :create, {:medication => { "nui" => "invalid value" }}, valid_session
        assigns(:medication).should be_a_new(Medication)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Medication.any_instance.stub(:save).and_return(false)
        post :create, {:medication => { "nui" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested medication" do
        medication = Medication.create! valid_attributes
        # Assuming there are no other medications in the database, this
        # specifies that the Medication created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Medication.any_instance.should_receive(:update).with({ "nui" => "MyString" })
        put :update, {:id => medication.to_param, :medication => { "nui" => "MyString" }}, valid_session
      end

      it "assigns the requested medication as @medication" do
        medication = Medication.create! valid_attributes
        put :update, {:id => medication.to_param, :medication => valid_attributes}, valid_session
        assigns(:medication).should eq(medication)
      end

      it "redirects to the medication" do
        medication = Medication.create! valid_attributes
        put :update, {:id => medication.to_param, :medication => valid_attributes}, valid_session
        response.should redirect_to(medication)
      end
    end

    describe "with invalid params" do
      it "assigns the medication as @medication" do
        medication = Medication.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Medication.any_instance.stub(:save).and_return(false)
        put :update, {:id => medication.to_param, :medication => { "nui" => "invalid value" }}, valid_session
        assigns(:medication).should eq(medication)
      end

      it "re-renders the 'edit' template" do
        medication = Medication.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Medication.any_instance.stub(:save).and_return(false)
        put :update, {:id => medication.to_param, :medication => { "nui" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested medication" do
      medication = Medication.create! valid_attributes
      expect {
        delete :destroy, {:id => medication.to_param}, valid_session
      }.to change(Medication, :count).by(-1)
    end

    it "redirects to the medications list" do
      medication = Medication.create! valid_attributes
      delete :destroy, {:id => medication.to_param}, valid_session
      response.should redirect_to(medications_url)
    end
  end

end
