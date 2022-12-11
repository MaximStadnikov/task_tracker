require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }

    context "NORM " do
      let!(:project) { create :project }

      it { expect { interactor.run }.to change(Project.all, :count).by(-1) }
    end

    context "NE NORM" do
      let(:expected_error_message) { "Invalid Data" }
      let(:project) { create :project }

      before do
        allow(project).to receive(:destroy).and_return(false)
      end

      it "passes error to context" do
        interactor.run

        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
