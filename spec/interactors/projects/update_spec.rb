require("rails_helper")

describe Projects::Update::Execute do
    describe ".call" do
        let(:interactor) { described_class.new(project: project, project_params: project_params) }
        let(:project) { create(:project) }

        context "the project is updated" do
            let(:project_params) do
              {
                name: "Other name sample",
                description: "Other description example"
              }
            end

            it "correctly changes name" do
                expect { interactor.run }.to change(project, :name)
            end

            it "correctly changes description" do
                expect { interactor.run }.to change(project, :description)
            end
        end

        context "the projects is not updated" do
            let(:project_params) { {other: "not true"} }
            let(:expected_error) { "Invalid Data" }
            before do
                allow(project).to receive(:update).and_return(false)
            end

            it "gets error" do
                interactor.run
                expect(interactor.context.error).to eq(expected_error) 
            end
        end

    end
end
