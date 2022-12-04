module Users
  class Save
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = user

      context.fail!(errors: errors) unless user.update(user_params)

      context.user = user.reload
    end

    private

    def user
      @user ||= context.user || User.new
    end

    def errors
      [{ message: "Wrong email or password" }]
    end
  end
end
