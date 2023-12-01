class EnrollmentsController < ApplicationController

	def index
		@enrollments = current_user.enrollments.paginate(page: params[:page], per_page: 5)
	end

	def new
		@enrollment = Enrollment.new
		@event = Event.find(params[:event_id]) 	
	end

	def create
	  	@enrollment = Enrollment.new(enrollment_params)
	  	@event = Event.find(enrollment_params[:event_id])
	    if @enrollment.save!
	      	redirect_to @event, notice: "You've successfully registered for this event."
	      	# EventMailerWorker.perform_async(current_user.id, @event.id, 'Enrolled')
	    else
	    	render 'new'
	    end
	end

	def destroy
	  @enrollment = Enrollment.find(params[:id])
	  @enrollment.destroy!
	  redirect_to enrollments_path, notice: 'Registration was successfully destroyed.'	  
	end

	private

	def enrollment_params
		params.require(:enrollment).permit(:user_id, :event_id)
	end

end




