class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable  
has_many :post, dependent: :destroy
#has_many :active_applies, class_name:  "Apply",
 #                                 foreign_key: "user_id",
  #                                dependent:   :destroy

                                  
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable
end
