require("rails_helper")

describe Users::Authenticate do
  let(:interactor) { described_class.new(credentials: credentials) }

  context "valid credentials" do
    let!(:user) { create :user }
    let(:credentials) do
      {
        email: "admin@admin.ru",
        password: "123456"
      }
    end

    it "should create token" do
      interactor.run
      expect(interactor.context.access_token).to be_present
    end
  end

  context "valid credentials" do
    let!(:user) { create :user }
    let(:credentials) do
      {
        email: "admin@admin.ru",
        password: "wrong"
      }
    end

    it "should create token" do
      interactor.run
      expect(interactor.context.access_token).to_not be_present
    end
  end
end
