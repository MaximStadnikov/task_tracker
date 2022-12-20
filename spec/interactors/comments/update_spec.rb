require("rails_helper")

describe Comments::Update do
  let(:interactor) { described_class.new(comment: comment, comment_params: comment_params) }

  context "valid params" do
    let!(:comment) { create :comment }
    let!(:comment_params) do
      {
        content: "new content"
      }
    end
    let(:expected_content) { "new content" }

    it "should update" do
      interactor.run
      expect(comment.content).to eq(expected_content)
    end
  end

  context "invalid params" do
    let!(:comment) { create :comment }
    let(:comment_params) do
      {
        invalid: "not valid"
      }
    end

    before do
      allow(comment).to receive(:update).and_return(false)
    end

    it "get error" do
      interactor.run
      expect(interactor.context.error).to eq("Invalid Data")
    end
  end
end
