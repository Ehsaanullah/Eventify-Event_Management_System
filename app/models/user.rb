class User < ApplicationRecord
 
  # before_create :generate_confirmation_code
  # after_commit :send_confirmation_code_email, on: :create

  has_many :events
  has_many :enrollments
  has_many :reviews

  # validates :name, presence: true
  # validates :lname, presence: true
  
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :omniauthable, omniauth_providers: [:google_oauth2]



  private

  # def generate_confirmation_code
  #   self.confirmation_code = SecureRandom.hex(3)
  # end

  # def send_confirmation_code_email
  #   # UserMailer.confirmation_code_email(self).deliver_now
  # end

  def self.from_google(email:, uid: )
    find_or_create_by!(email: email, uid: uid, provider: 'google_oauth2')
  end
  
  # def valid_confirmation_code?(code)
  #   code == confirmation_code
  # end

  

  

end
