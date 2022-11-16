require "rails_helper"

describe Projects::Create do
  describe ".organized" do
    # subject { described_class.organized }

    let(:expected_interactors) do
      [
        Projects::Save,
        Projects::Create::CreateOwner,
        Projects::Create::SendNotification
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
