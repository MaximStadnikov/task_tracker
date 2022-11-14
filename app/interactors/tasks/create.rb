module Tasks
  class Create
    include Interactor::Organizer

    organize Tasks::Save,
             Tasks::Create::SendNotifications
  end
end
