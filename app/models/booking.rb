class Booking < ApplicationRecord
  belongs_to :parent
  belongs_to :caregiver
    
    after_create :update_caregiver_booking_status
    before_destroy :update_caregiver_booking_status
    before_update :update_caregiver_booking_status
    
    private
    
    def update_caregiver_booking_status
      self.caregiver.update(is_booked: self.status == "Accepted")
    end
end

  