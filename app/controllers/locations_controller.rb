class LocationsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index  
        locations = Location.all
        render json: locations
    end

    def show
        location = location.find(params[:id])
        render json: location
    end

    def create
        location = Location.create!(location_params)
        if location.valid?
            render json: location, status: :created
        else
            render json: { errors: location.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        location = location.find(params[:id])
        location.update(location_params)
        render json: location
    end

    def destroy
        location = location.find(params[:id])
        location.destroy
        render json: location
    end

    private
    def location_finder
        location = Location.find_by(id: params[:id])
    end

    def location_params
        params.permit(:caregiver_id, :city, :town, :street_address, :province, :postal_zipcode)
      end

    def render_not_found_response
        render json: { error: "Location not found" }, status: :not_found
    end

end
