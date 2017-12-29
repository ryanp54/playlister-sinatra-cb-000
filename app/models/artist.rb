require_relative './helpers.rb'

class Artist < ActiveRecord::Base
	extend Helpers::ClassMethods
	include Helpers::InstanceMethods
	has_many :songs
	has_many :genres, through: :songs
end