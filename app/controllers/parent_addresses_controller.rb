class ParentAddressesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index  
        parent_addresses = ParentAddress.all
        render json: parent_addresses
    end

    def show
        parent_address = parent_address.find(params[:id])
        render json: parent_address
    end

    def create
        @parent_address = ParentAddress.new(parent_address_params)
    
        if @parent_address.save
          render json: @parent_address, status: :created, location: @parent_address
        else
          render json: @parent_address.errors, status: :unprocessable_entity
        end
    end

    def update
        parent_address = parent_address.find(params[:id])
        parent_address.update(parent_address_params)
        render json: parent_address
    end

    def destroy
        parent_address = parent_address.find(params[:id])
        parent_address.destroy
        render json: parent_address
    end

    private

    def parent_address_finder
        parent_address = Parent_address.find_by(id: params[:id])
    end

    def parent_address_params
        params.permit(:parent_id, :city, :town, :street, :address, :province, :postal, :zipcode)
      end

    def render_not_found_response
        render json: { error: "Parent_address not found" }, status: :not_found
    end

end
