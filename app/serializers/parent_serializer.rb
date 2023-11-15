class ParentSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :phone, :image,  :reviews, :caregivers
end
