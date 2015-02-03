class Apply < ActiveRecord::Base
	# belongs_to :follower, class_name: "User"
 #  	belongs_to :followed, class_name: "User"

	belongs_to :applyer, class_name: "User"
	belongs_to :applyed, class_name: "Post"

  	validates :user_id, presence: true
  	validates :post_id, presence: true
end
