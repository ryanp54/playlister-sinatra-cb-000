require_relative './helpers.rb'

class Song < ActiveRecord::Base
	extend Helpers::ClassMethods
	include Helpers::InstanceMethods
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres
end	