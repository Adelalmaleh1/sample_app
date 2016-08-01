class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image,
	styles: { medium: "200x300>", thumb: "100x100>" },
	default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :articles
  acts_as_followable
  acts_as_follower
  acts_as_messageable
  
   def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
