
class Parent < ApplicationRecord
   
  has_many :reviews, dependent: :destroy
    has_many :caregivers, through: :reviews 
    has_one :parent_address
    has_many :bookings, dependent: :destroy
    has_many :caregivers, through: :bookings
   
    has_secure_password
    # validates :username, presence: true, uniqueness: true
    #  validates :email, presence: true, uniqueness: true

     validates :password, length: { minimum: 5, wrong_length: "Password must be at least 5 characters." }, if: :password
  
  
  #password reset methods
    def send_password_reset
      self.password_reset_token = generate_base64_token
      self.password_reset_sent_at = Time.zone.now
      save!
      PasswordResetsMailer.password_reset(self).deliver_now
    end
  
    def password_token_valid?
      (self.password_reset_sent_at + 1.hour) > Time.zone.now
    end
  
    def reset_password(password)
      self.password_reset_token = nil
      self.password = password
      save!
    end
  
    private
  
    def generate_base64_token
      test = SecureRandom.urlsafe_base64
    end
    
  end
  #This will create a one-to-many relationship between the review and the parent and caregiver models.
