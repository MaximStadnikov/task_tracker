require("rails_helper")

describe Projects::Destroy::Execute do
  
  let(:interactor) { described_class.new(project: project) } 
  describe ".call" do
    context "projects deleted" do
      let!(:project) { create(:project) }
      it { expect{ interactor.run }.to change(Project, :count).by(-1) }
    end

    context "project is not deleted" do
      let!(:project) { create(:project) }
      let(:error_expected) { "Invalid Data" }
      before do
        allow(project).to receive(:destroy).and_return(false)
      end
      
      it "throws error" do
        interactor.run
        expect(interactor.context.error).to eq(error_expected)
      end

    end

  end
end