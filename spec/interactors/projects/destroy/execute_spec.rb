require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }

    context "NORM " do
      let!(:project) { create :project }

      it { expect { interactor.run }.to change(Project.all, :count).by(-1) }
    end

    context "NE NORM" do
      let(:project) { create :project }

      let(:expected_error_message) { "Invalid Data" }

      it "fail" do
        expect(Project.exists?(project.id)).to be false

        interactor.run
        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
