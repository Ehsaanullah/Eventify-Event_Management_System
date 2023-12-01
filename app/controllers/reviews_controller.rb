class ReviewsController < ApplicationController

	def index
		@reviews = current_user.enrollments.joins(:event).where('events.expiry_date < ?', Date.today)
			.paginate(page: params[:page], per_page: 5)

	end

	def new
		@review = Review.new
		@event = Event.find(params[:event_id]) 
	end

	def create
  		event_id = review_params[:event_id]
  		@review = Review.new(review_params)
		@review.rating = params[:rating].to_i

	  	if @review.save!
			ReviewJob.perform_async(event_id, @current_user.id)
	    	redirect_to event_path(@review.event), notice: 'Review Added Successfully.'
	  	else
	    	@event = Event.find(params[:event_id])
	    	render 'new'
	  	end
	end


	private

	def review_params
		params.require(:review).permit(:feedback, :user_id, :event_id)
	end
end

