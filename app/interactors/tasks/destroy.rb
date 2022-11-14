module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroy::Execute,
             Tasks::Destroy::SendNotifications
  end
end
