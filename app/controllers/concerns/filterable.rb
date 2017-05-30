module Filterable
	extend ActiveSupport::Concern

	module ClassMethods
		# Pre-condition: filtering_params is a slice of params based on query
		def filter(filtering_params)
			results = self.where(nil) # Anonymous scope
			filtering_params.each do |key, value|
				results = results.public_send(key, value) if value.present? # get all results based on key and value scoping
			end
			return results
		end
	end
end
