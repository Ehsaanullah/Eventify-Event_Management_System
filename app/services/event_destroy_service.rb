class EventDestroyService
  def self.destroy_event(event)
   
    if event.destroy
      event
    else
      nil
    end
  end
end
