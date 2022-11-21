require("rails_helper")

describe Projects::Update do
  describe ".organized" do
    let(:expected_interactors_order) do
      [
        Projects::Update::Execute,
        Projects::Update::SendNotification
      ]
    end

    it "expected specific order" do
      expect(described_class.organized).to eq(expected_interactors_order)
    end
  end
end
