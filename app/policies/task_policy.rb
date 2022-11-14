class TaskPolicy < ApplicationPolicy
    authorize :user, optional: true

    def index?
        true
    end

    def show?
        member?
    end

    def new?
        create?
    end

    def create?
        member?
    end

    def edit?
        update?  
    end

    def update?
        member?
    end

    def destroy?
        member?
    end

    private 

    def member?
        user.present? && record.project.users.each {|u| u == user }
    end

end
