require 'rails_helper'

RSpec.describe AutomobilesController, type: :controller do

  let(:user_session) { sign_in create(:user) }
  let(:invalid_session) { {} }
  let(:admin_session) { sign_in create(:admin) }

  describe "GET #index" do
    it "assigns all automobiles as @automobiles" do
      automobile = create(:automobile)
      get :index, params: {}, session: user_session
      expect(assigns(:automobiles)).to eq([automobile])
    end
  end

  describe "GET #show" do
    it "assigns the requested automobile as @automobile" do
      automobile = create(:automobile)
      get :show, id: automobile.to_param, session: user_session
      expect(assigns(:automobile)).to eq(automobile)
    end
  end

  describe "GET #new" do
    context "with valid session" do
      it "assigns a new automobile as @automobile" do
        get :new, params: {}, session: admin_session
        expect(assigns(:automobile)).to be_a_new(Automobile)
      end
    end
    context "with invalid session" do
      it "redirect to 'root_path'" do
        get :new, params: {}, session: invalid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #edit" do
    context "with valid session" do
      it "assigns the requested automobile as @automobile" do
        automobile = create(:automobile)
        get :edit, id: automobile.to_param, session: admin_session
        expect(assigns(:automobile)).to eq(automobile)
      end
    end
    context "with invalid session" do
      it "redirect to 'root_path'" do
        automobile = create(:automobile)
        get :edit, id: automobile.to_param, session: invalid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Automobile" do
        automobile = build(:automobile)
        expect {
          post :create, automobile: automobile.attributes, session: user_session
        }.to change(Automobile, :count).by(1)
      end

      it "assigns a newly created automobile as @automobile" do
        automobile = build(:automobile)
        post :create, automobile: automobile.attributes, session: user_session
        expect(assigns(:automobile)).to be_a(Automobile)
        expect(assigns(:automobile)).to be_persisted
      end

      it "redirects to the created automobile" do
        automobile = build(:automobile)
        post :create, automobile: automobile.attributes, session: user_session
        expect(response).to redirect_to(Automobile.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved automobile as @automobile" do
        automobile = build(:invalid_automobile)
        post :create, automobile: automobile.attributes, session: user_session
        expect(assigns(:automobile)).to be_a_new(Automobile)
      end

      it "re-renders the 'new' template" do
        automobile = build(:invalid_automobile)
        post :create, automobile: automobile.attributes, session: user_session
        expect(response).to render_template("new")
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do {
        :brand => "NewBrand",
        :model => "NewModel",
        :modification => "newModification"
      }
      end

      it "updates the requested automobile" do
        automobile = create(:automobile)
        put :update, id: automobile.to_param, automobile: new_attributes, session: user_session
        automobile.reload
      end

      it "assigns the requested automobile as @automobile" do
        automobile = create(:automobile)
        put :update, id: automobile.to_param, automobile: automobile.attributes, session: user_session
        expect(assigns(:automobile)).to eq(automobile)
      end

      it "redirects to the automobile" do
        automobile = create(:automobile)
        put :update, id: automobile.to_param, automobile: automobile.attributes, session: user_session
        expect(response).to redirect_to(automobile)
      end
    end

    context "with invalid params" do
      it "assigns the automobile as @automobile" do
        automobile = create(:automobile)
        invalid_automobile = build(:invalid_automobile)
        put :update, id: automobile.to_param, automobile: invalid_automobile.attributes, session: user_session
        expect(assigns(:automobile)).to eq(automobile)
      end

      it "re-renders the 'edit' template" do
        automobile = create(:automobile)
        invalid_automobile = build(:invalid_automobile)
        put :update, id: automobile.to_param, automobile: invalid_automobile.attributes, session: user_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested automobile" do
      automobile = create(:automobile)
      expect {
        delete :destroy, id: automobile.to_param, session: admin_session
      }.to change(Automobile, :count).by(-1)
    end

    it "redirects to the automobiles list" do
      automobile = create(:automobile)
      delete :destroy, id: automobile.to_param, session: admin_session
      expect(response).to redirect_to(automobiles_url)
    end
  end

end
