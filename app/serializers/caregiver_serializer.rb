class CaregiverSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :bio, :image, :location, :reviews, :is_booked, :bookings, :hourly_rate, :experience
end
