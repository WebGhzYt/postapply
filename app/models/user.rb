class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable  
has_many :post, dependent: :destroy
#has_many :active_applies, class_name:  "Apply",
 #                                 foreign_key: "user_id",
  #                                dependent:   :destroy
#self.per_page = 10
has_many :active_apply, class_name: "applies",foreign_key: "user_id",
                                  dependent:   :destroy
has_many :applying, through: :active_apply, source: :applyed

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable


def apply(post)
    active_apply.create(post_id: post.id)
end

  # Unapply a user.
def unapply(post)
    active_apply.find_by(post_id: post.id).destroy
end

  # Returns true if the current user is Applying the Post.
def applying?(post,user)
    apply = Apply.find_by_post_id_and_user_id(post.id,user.id)
    if apply.nil?
    	false
    else
    	true
    end
end

end
