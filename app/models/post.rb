class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :experience,:salary,:post, :presence => true
  validates :experience, inclusion: { in: 0..800 }
  validates :user_id, presence: true
  
  belongs_to :user
end
