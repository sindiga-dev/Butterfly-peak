class BookingSerializer < ActiveModel::Serializer
  attributes :id, :parent, :caregiver, :start_time, :end_time, :status
end
