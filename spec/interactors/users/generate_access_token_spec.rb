require "rails_helper"

describe Users::GenerateAccessToken do 
  describe ".call" do 

    user = User.create(
      id: 1,
      email: "admin@admin.ru",
      password: "123456")

    let!(:interactor) { described_class.new(user: user) }

    it "existince of token" do
      interactor.run

      expect(interactor.context.access_token).present?
    end

    context "when context contains the user" do

      let!(:interactor) { described_class.new(user: user) }

      it "user present" do
        interactor.run

        expect(interactor.context.user).present?
      end
    end
  end
end
