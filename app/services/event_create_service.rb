class EventCreateService
  def self.create_event(event, user_id)
    user = User.find(user_id)
    event.user = user

    if event.save
        event
    else
        nil
    end
  end
end