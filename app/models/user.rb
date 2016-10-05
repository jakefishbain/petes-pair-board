class User < ActiveRecord::Base
  has_many :feedbacks, as: :feedbackable
  has_many :pairings
  has_and_belongs_to_many :topics
end
