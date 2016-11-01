require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Association" do
    let(:c) { create(:comment) }
    let(:a) { create(:automobile) }

    context "automobile - comments" do
      it "comment should belongs to one automobile" do
        c.automobile = a
        expect(c.automobile).to eq(a)
      end

      it "one automobile should have many comments" do
        a.comments << c
        expect(a.comments.count).to eq(1)
      end
      
    end
  end
end
