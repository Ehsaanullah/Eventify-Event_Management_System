class EventsController < ApplicationController
	def index
		@q = Event.ransack(params[:q])
		@filtered_events = @q.result
		@events = EventPaginationService.pagination(@filtered_events, current_user, :event_id, 4, params[:page])
	end


	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def edit
		@event = Event.find(params[:id])
	end


	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		if @event.save!			
			# EventCreationJob.perform_async(current_user.attributes.transform_values(&:to_s).stringify_keys)
			EventCreationJob.perform_async(@event.id, @current_user.id)
			# UserMailer.event_created_email(current_user).deliver_now				
			redirect_to @event, notice: 'Event was successfully created'
		else
			puts "Error found "
			render 'new'
		end

		
	end


	def update
		@event = Event.find(params[:id])
		result = EventUpdateService.update_event(@event,event_params)
		if result
			redirect_to result, notice: 'Event successfully Updated'
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		result = EventDestroyService.destroy_event(@event)
		if result
			redirect_to events_path, notice: 'Event was successfully destroyed.'
		end
	end

	def expire_events		
		@exp = Event.all.where('expiry_date < ?', Date.today)
		@expired_event_reviews = Review.where(event_id: @exp.pluck(:id))

		@exp= PaginationService.pagination(@exp,params[:page], 4)
  		render 'expire_events'
	end

	private
	
	def event_params
		params.require(:event).permit(:title, :description, :location, :expiry_date, :available_slots, :category, :date, :time, :image)
	end

end
