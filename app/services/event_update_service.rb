class EventUpdateService
  def self.update_event(event, params)
    if event.update(params)
      event
    else
      nil
    end
  end
end