module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Update::Execute,
             Tasks::Update::SendNotifications
  end
end
