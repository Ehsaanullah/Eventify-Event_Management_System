class EventCreationJob
  include Sidekiq::Job

    def perform(event_id, user_id)
      event = Event.find(event_id)
      user = User.find(user_id)

      puts "EventCreationWorker is processing in Sidekiq for hahahaha #{user.email} "

      UserMailer.event_created_email(user,event).deliver
    end
end

