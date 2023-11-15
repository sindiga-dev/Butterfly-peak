class FavouriteSerializer < ActiveModel::Serializer
  attributes :id, :name, :nanny_url, :nannyLocation, :rating, :nannyPrice
end
