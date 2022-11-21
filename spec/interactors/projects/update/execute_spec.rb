require("rails_helper")

describe Projects::Update::Execute do
  let(:interactor) { described_class.new(project: project, project_params: project_params) }

  describe ".call" do
    context "when the project is updated" do
      let!(:project) { create(:project) }
      let(:project_params) do
        {
          name: "new name",
          description: "new description"
        }
      end

      it "changes name attribute" do
        expect { interactor.run }.to change(project, :name).to("new name")
      end

      it "changes description attribute" do
        expect { interactor.run }.to change(project, :description).to("new description")
      end
    end

    context "when the project is not updated" do
      let!(:project) { create(:project) }
      let(:project_params) { { error: "invalid params" } }
      let(:error_expected) { "Invalid Data" }

      before do
        allow(project).to receive(:update).and_return(false)
      end

      it "throws error" do
        interactor.run
        expect(interactor.context.error).to eq(error_expected)
      end
    end
  end
end
