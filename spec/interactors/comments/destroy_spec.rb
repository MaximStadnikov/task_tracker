require 'rails_helper'

describe Comments::Destroy do
  
  let(:interactor) { described_class.new(comment: comment) }
  
  context "correct params" do
    let!(:comment) { create :comment }

    it "removes comment" do
      expect { interactor.run }.to change(Comment, :count).by(-1)
    end
  end

  context "incorrect params" do
    
    let!(:comment) { create :comment }
    let(:expected_error) { "Invalid Data" }


    before do
        allow(comment).to receive(:destroy).and_return(false)
    end

    it "get error" do
      interactor.run
      expect(interactor.context.error).to eq(expected_error)
    end
  end

end
