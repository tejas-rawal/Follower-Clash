require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
	class User
		def initialize()
		end
	end

	class Comparer
		def initialize(user1, user2)
			@user1 = user1
			@user2 = user2
		end

		def compare
		end
	end
end