require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        comment = build(:comment)
        automobile = create(:automobile)
        expect{
          post :create, comment: comment.attributes, automobile_id: automobile.id
        }.to change(Comment,:count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        comment = build(:comment)
        automobile = create(:automobile)
        post :create, comment: comment.attributes, automobile_id: automobile.id
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created automobile comment" do
        comment = build(:comment)
        automobile = create(:automobile)
        post :create, comment: comment.attributes, automobile_id: automobile.id
        expect(response).to redirect_to(automobile_path(automobile.id))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = build(:comment)
      automobile = create(:automobile)
      comment.automobile_id = automobile.id
      comment.save
      expect {
        delete :destroy, id: comment.to_param, automobile_id: automobile.id
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the automobiles list" do
      comment = build(:comment)
      automobile = create(:automobile)
      comment.automobile_id = automobile.id
      comment.save
      delete :destroy, id: comment.to_param, automobile_id: automobile.id
      expect(response).to redirect_to(automobile_path(automobile.id))
    end
  end

end
