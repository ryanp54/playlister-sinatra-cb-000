require 'pry'

module Helpers
	
	module InstanceMethods
		def slug
			self.name.downcase.gsub(/ /, '-') if self.name
		end
	end

	module ClassMethods
		def find_by_slug(slug_s)
			self.all.find do |item|
				item.slug == slug_s
			end
		end
	end

end