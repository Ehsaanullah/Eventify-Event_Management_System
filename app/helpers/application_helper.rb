module ApplicationHelper
	def pagination_helper(event)
  		will_paginate event, renderer: WillPaginate::ActionView::BootstrapLinkRenderer
	end
end
