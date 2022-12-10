require "rails_helper"

describe Projects::Update::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project, project_params: params) }

    context "norm params" do
      let(:project) { create :project }
      let(:params) do
        { name: "MyTestNameForUpdate" }
      end

      it "everything works" do
        interactor.run
        expect(interactor.context.project.name).to eq(params[:name])
      end
    end

    context "not updated" do
      let(:expected_error_message) { "Invalid Data" }

      before do
        allow(project).to receive(:update).and_return(false)
      end

      it do
        interactor.run

        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
