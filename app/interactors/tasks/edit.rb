module Tasks
  class Edit
    include Interactor::Organizer

    organize Tasks::Update,
             Tasks::Update::SendNotification

  end
end