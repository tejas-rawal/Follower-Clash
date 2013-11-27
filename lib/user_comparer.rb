require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
	class User
		
		attr_reader :username

		def initialize(username)
			@username = username
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key = ENV['CONSUMER_KEY']
				config.consumer_secret = ENV['CONSUMER_SECRET']
				config.access_token = ENV['OAUTH_TOKEN']
				config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
			end
		end

		def followers

			@client.user(@username).followers_count
		end

		def friends

			@client.user(@username).friends_count
		end

		def tweets

			@client.user(@username).statuses_count
		end
	end

	class Comparer

		attr_reader :user1, :user2

		def initialize(user1, user2)
			@user1 = user1
			@user2 = user2
		end

		def compare_followers
			follower_comparison = @user1.followers - @user2.followers

			if follower_comparison > 0
				return "#{@user1.username} beats #{@user2.username} by #{follower_comparison}."

			elsif follower_comparison < 0
				return "#{@user2.username} beats #{@user1.username} by #{follower_comparison * -1}."
			else
				return "There is a tie!"
			end
		end

		def compare_friends
			friends_comparison = user1.friends - @user2.friends

			if friends_comparison > 0
				return "#{@user1.username} is following #{friends_comparison} more people than #{@user2.username}."
			elsif friends_comparison < 0
				return "#{@user2.username} is following #{friends_comparison * -1} more people than #{@user1.username}."
			else
				"#{@user1.username} and #{@user2.username} have the same number of friends."
			end
		end

		def compare_tweets
			tweets_comparison = @user1.tweets - @user2.tweets

			if tweets_comparison > 0
				return "#{@user1.username} has #{tweets_comparison} more tweets than #{@user2.username}."
			elsif tweets_comparison < 0
				return "#{@user2.username} has #{tweets_comparison * -1} more tweets than #{@user1.username}."
			else
				"#{@user1.username} and #{@user2.username} have the same amount of friends."
			end
		end
	end
end