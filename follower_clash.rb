require 'rubygems'
require 'bundler/setup'

require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('ornellasmike')
user2 = UserComparer::User.new('techpeace')
puts "#{user1.username}'s follower count: #{user1.followers}"
puts "#{user2.username}'s follower count: #{user2.followers}"

comparer = UserComparer::Comparer.new(user1, user2)
puts "And the user with the most followers is: #{comparer.compare_followers}"
puts "And the user with the most friends is: #{comparer.compare_friends}"
puts "And the user with the most tweets is: #{comparer.compare_tweets}"