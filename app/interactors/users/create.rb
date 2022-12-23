module Users
  class Create
    include Interactor::Organizer

    organize Users::Save,
             Users::GenerateToken
  end
end
