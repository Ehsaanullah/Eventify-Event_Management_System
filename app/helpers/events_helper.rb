module EventsHelper
	def display_event_image(event)
		if event.image.attached?
			image_tag(event.image, style: "max-width: 100%; height: auto;",class: "container" )
		else
			image_tag("https://www.srptoilethire.co.uk/wp-content/uploads/2017/11/shutterstock_437490805.jpg", class: "card-img-top",alt: "...")			
		end		
	end

	def display_event_attributes(event)
		content = ""
		content += content_tag(:p, content_tag(:strong, "Title: ")+ event.title, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Description: ")+ event.description, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Date: ")+ event.date.to_s, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Time: ")+ event.time.to_s, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Location: ")+ event.location, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Category: ")+ event.category, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Available Slots: ")+ event.available_slots.to_s, class: "table container")
		content += content_tag(:p, content_tag(:strong, "Expiry Date: ")+ event.expiry_date.to_s, class: "table container")
		content.html_safe
	end

	

	def display_card_details(event, max_length)
		content = ""
		content += content_tag(:h5, event.title, class: "card-title")
		content += content_tag(:p, class: 'card-text') do
			if event.description.length > max_length
		      "#{event.description[0, max_length]}..."
		    else
		      event.description
		    end
		end
		content += content_tag(:p, class: 'read-more') do
			if event.description.length > max_length
				link_to "read more", event 	
			end
		end
		content.html_safe
	end

	def display_event_reviews(event,expired_event_reviews)
		reviews = expired_event_reviews.select { |review| review.event_id == event.id }

	    if reviews.present?
	      content_tag(:h6, 'Attendees Reviews:') +
	        reviews.map do |review|
	          content_tag(:h8, "User ID: #{review.user_id}") +
	            content_tag(:ul, content_tag(:li, review.feedback))
	        end.join.html_safe
	    end
		
	end

	def event_search(f)
		content = ""
		content += f.search_field :title_cont, placeholder: "Enter Event Title", class: "form-control card-container"
		content += f.search_field :location_cont, placeholder: "Enter Event location", class: "form-control card-container"
		content += f.search_field :category_cont, placeholder: "Enter Event Category", class: "form-control card-container"
		content += f.search_field :expiry_date_gteq, placeholder: "Enter Event Expiry Date", class: "form-control card-container"
		content += f.submit "Search", class: "btn btn-info glyphicon glyphicon-search card-container"
		content.html_safe
	end

	def display_buttons(event, current_user, enrollment)

	    buttons = []

	    if can_register_for_event?(event, current_user)
	      	buttons << link_to('Register for this Event', new_event_enrollment_path(event), class: 'btn btn-primary')
	    end

	    if can_edit_event?(event, current_user)
	      	buttons << link_to('Edit this event', edit_event_path(event), class: 'btn btn-primary')
	    end

	    buttons << link_to('Back to events', events_path, class: 'btn btn-primary')

	    if can_add_review?(event, current_user)
	      	buttons << link_to('Add Review', new_event_review_path(event), class: 'btn btn-primary')
	    end

		buttons << '<br><br>'.html_safe if should_display_line_break?(event, current_user)

		if can_destroy_event?(event, current_user)
		  buttons << turbo_frame_tag(enrollment) do
		    button_to('Destroy this event', event, method: :delete, data: { turbo_confirm: 'Are you sure?', turbo_frame: 'events' }, class: 'btn btn-dark')
		  end
		end
	    buttons.join('  ').html_safe		
	end

	def event_form(form, attribute, label, placeholder, input_type,options={})
	    content_tag(:div) do

	      	if label.present?
	        	form.label(attribute, label) + "<br>".html_safe
	      	else
	        "".html_safe
	      	end +
	      	form.public_send("#{input_type}_field", attribute, options.merge(placeholder: placeholder, class: "form-control form-control-lg", value: form.object.public_send(attribute).presence))
	    end
	end
		

	private

	def can_register_for_event?(event, current_user)
		!(event.user_id == current_user.id) && !(current_user.enrollments.exists?(event_id: event.id)) && (event.expiry_date >= Date.today)
	end

	def can_edit_event?(event, current_user)
		event.expiry_date > Date.today && event.user_id == current_user.id
	end

	def can_add_review?(event, current_user)
		event.expiry_date <= Date.today && event.enrollments.exists?(user_id: current_user.id)
	end

	def can_destroy_event?(event, current_user)
		event.expiry_date > Date.today && event.user_id == current_user.id
	end
	# for line breaking
	def should_display_line_break?(event, current_user)
    	can_destroy_event?(event, current_user)
  	end
end

 