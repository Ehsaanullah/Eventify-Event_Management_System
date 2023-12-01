class ReviewJob
  include Sidekiq::Job

    def perform(event_id, user_id)
      event = Event.find(event_id)
      user = User.find(user_id)

      puts "ReviewJob is processing in Sidekiq for hahahaha Event Created by #{event.user.email} and Reviewed by #{user.email}"

      UserMailer.review_event_email(user,event).deliver_now
    end
end

