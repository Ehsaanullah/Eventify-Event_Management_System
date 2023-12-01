class EventPaginationService
  	def self.pagination(filter_param, current_user, event_id, per_page, page)
    	filter_param = filter_param.where.not(id: current_user.enrollments.pluck(event_id)).
                               where('expiry_date >= ?', Date.today).
                               paginate(page: page, per_page: per_page)
  	end
end
