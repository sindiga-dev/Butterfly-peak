class ImagesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index  
        images = Image.all
        render json: images
    end

    def show
       image = image.find(params[:id])
       render json: image
    end

    def create
        @image = Image.new(image_params)
    
        if @image.save
          render json: @image, status: :created, location: @image
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end

    def update
        image = image.find(params[:id])
        image.update(image_params)
        render json: image
    end

    def destroy
        image = image.find(params[:id])
        image.destroy
        render json: image
    end

    private

    def image_finder
        image = Image.find_by(id: params[:id])
    end

    def image_params
        params.permit(:caregiver_id, :image1, :image2, :image3)
    end

    def render_not_found_response
        render json: { error: "Image not found" }, status: :not_found
    end

end
