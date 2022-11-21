require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }

    context "project destroyed" do
      let!(:project) { create(:project) } # the ! saves the project to database

      it { expect { interactor.run }.to change(Project, :count).by(-1) }
    end

    context "project destroy fails" do
      let!(:project) { create(:project) }
      
      let(:error_name_expected) { "Invalid Data" }

      before do
        # we set the project.destroy to return false in all cases
        allow(project).to receive(:destroy).and_return(false)
      end
      
      it "should fail" do
        interactor.run
        expect(interactor.context.error).to eq(error_name_expected)
      end
    end
    
  end
end