class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :parent, :caregiver
end
