class Event < ActiveRecord::Base
  has_many :comments
  has_many :users
end
