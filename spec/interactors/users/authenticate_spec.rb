require("rails_helper")

describe Users::Authenticate do
  let(:interactor) { described_class.new(credentials: credentials) }

  context "Correct credentials" do
    let!(:user) { create :user }

    let(:credentials) do
      {
        email: "admin@admin.ru",
        password: "123456"
      }
    end

    it "generates token" do
      interactor.run
      expect(interactor.context.access_token).to be_present
    end
  end

  context "Wrong credentials" do
    let!(:user) { create :user }
    let(:credentials) do
      {
        email: "admin@admin.ru",
        password: "this is not my password"
      }
    end
    let(:expected_error) { [{ message: "Wrong credentials" }] }

    it "gets error" do
      interactor.run
      expect(interactor.context.errors).to eq(expected_error)
    end
  end
end
