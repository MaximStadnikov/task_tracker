module Tasks
    class Create
        class NotifyAllMembers
            include Interactor

            delegate :users, :task, :creator, to: :context

            def call
                users.each do |user|
                    TaskMailer.task_created(task, user, creator).deliver_later
                end
            end
        end
    end
end