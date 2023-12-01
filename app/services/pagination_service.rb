class PaginationService
	def self.pagination(exp,page,per_page)
		exp = exp.paginate(page: page, per_page: per_page)
	end

end