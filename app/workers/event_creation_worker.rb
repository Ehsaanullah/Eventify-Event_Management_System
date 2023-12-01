class EventCreationWorker
  include Sidekiq::Worker

  def perform(user_id)
    Sidekiq::Logging.logger.info("EventCreationWorker is processing in Sidekiq for user_id: #{user_id}")
    user = User.find(user_id)
    event = Event.new(event_params)
    if event.save!
      Sidekiq::Logging.logger.info("EventCreationWorker successful for user_id: #{user_id}")      
      true
    else
      Sidekiq::Logging.logger.error("EventCreationWorker failed for user_id: #{user_id}")
      false
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :expiry_date, :available_slots, :category, :date, :time, :image)
  end
end
