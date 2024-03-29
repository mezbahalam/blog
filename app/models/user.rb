class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



   has_many :posts

   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :display_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /\A[a-zA-Z0-9_\-]+\z/,
                             message: 'Must be formatted correctly.'
                           }



   def to_param
     display_name
   end


  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end



end
