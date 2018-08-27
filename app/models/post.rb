# Represents a timeline post
class Post < ActiveRecord::Base
  validates_presence_of :body
  validates_length_of :body, minimum: 1, maximum: 150
  validates_uniqueness_of :body, scope: :created_at
end
