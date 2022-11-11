module Tasks
  class Delete
    include Interactor::Organizer

    organize Tasks::Destroy,
             Tasks::Destroy::SendNotification
  end
end