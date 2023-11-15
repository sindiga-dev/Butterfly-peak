class FavouritesController < ApplicationController
    def create
  @favourite = Favourite.create!(favourite_params)
  
    render json: { message: 'Favourite added successfully' }, status: :created
      
end
  def show
  @favourite = Favourite.find(params[:id])
  render json: @favourite , status: :ok
end

def index
  @favourites = Favourite.all
  render json: @favourites, status: :ok
end
private

def favourite_params
  params.require(:favourite).permit(:name, :nanny_url, :nannyLocation, :rating, :nannyPrice)
end
end
