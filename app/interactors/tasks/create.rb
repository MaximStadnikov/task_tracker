module Tasks
    class Create
        include Interactor::Organizer
        
        organize Tasks::Save,
                Tasks::Create::SendNotification,
                Tasks::Create::NotifyAllMembers
    end
end