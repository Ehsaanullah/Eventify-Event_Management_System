module HomeHelper

	def before_sign_in()
		content = ""
		content += content_tag(:li, class:"nav-item active card-container") do
    		link_to("Login", new_user_session_path, class: "nav-link")
    	end

    	content += content_tag(:li, class:"nav-item active card-container") do
    		link_to("Sign up", new_user_registration_path, class: "nav-link")
    	end
		content.html_safe
	end

	def after_sign_in()
		content = ""
		content += content_tag(:li, class: "nav-item active card-container") do
	      	link_to(edit_user_registration_path, class: "nav-link") do
	        	concat content_tag(:i, nil, class: "fas fa-user", style: "color:#fb6b5b; margin-right:2px;")
        		concat " Edit Profile"
      		end
    	end
    	
    	content += content_tag(:li, class: "nav-item active card-container") do
	      	link_to(new_event_path, class: "nav-link") do
	        	concat content_tag(:i, nil, class: "fas fa-plus", style: "color:#fb6b5b; margin-right:2px;")
        		concat " Add Event"
      		end
    	end
    	
    	content += content_tag(:li, class:"nav-item active card-container") do
    		link_to("Active Events", events_path, class: "nav-link")
    	end
    	
    	content += content_tag(:li, class:"nav-item active card-container") do
    		link_to("Expire Events", expire_events_events_path, class: "nav-link")
    	end

    	content += content_tag(:li, class:"nav-item active card-container") do
    		link_to("Registered Events", enrollments_path, class: "nav-link")
    	end
    	
    	content += content_tag(:li, class: "nav-item active card-container") do
	      	link_to(reviews_path, class: "nav-link") do
	        	concat content_tag(:i, nil, class: "fas fa-comment", style: "color:#fb6b5b; margin-right:2px;")
        		concat " Review Events"
      		end
    	end
    	# Sidekiq Background Jobs Panel
    	if @current_user.email == 'm.ehsan@example.com'
	    	content += content_tag(:li, class:"nav-item active card-container") do
	    		link_to(sidekiq_web_path , class: "nav-link") do
	    			concat content_tag(:i, nil, class: "fas fa-tasks", style: "color:#fb6b5b; margin-right:1px;")
	        		concat " Sidekiq Jobs"
	      		end
    		end
    		content += content_tag(:li, class: "nav-item active card-container",style: "margin-left: 230px;") do
		      	link_to(destroy_user_session_path,data:{ turbo_method: :delete }, class: "nav-link") do
		        	concat content_tag(:i, nil, class: "fas fa-sign-out", style: "color:#fb6b5b; margin-right:1px;")
	        		concat " Sign out"
	      		end
	      	end
    	else
    		content += content_tag(:li, class: "nav-item active card-container",style: "margin-left: 350px;") do
		      	link_to(destroy_user_session_path,data:{ turbo_method: :delete }, class: "nav-link") do
		        	concat content_tag(:i, nil, class: "fas fa-sign-out", style: "color:#fb6b5b; margin-right:1px;")
	        		concat " Sign out"
	      		end
    		end
    	end

  

    	
    	content.html_safe
	end

end
