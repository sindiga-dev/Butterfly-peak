class ReviewsController < ApplicationController
    before_action :set_caregiver, only: [:index, :create]
    before_action :set_review, only: [:show, :update, :destroy]
    def index
        @reviews = @caregiver.reviews
        render json: @reviews
    end
    
    def create
        review = @caregiver.reviews.new(review_params)
        if review.save
            render json: review
        else
            render json: {error: 'Review not created'}, status: :unprocessable_entity
        end
    end
    
    def show
        review = @caregiver.reviews.find(params[:id])
        render json: review
    end
    
    def update
        review  = @caregiver.reviews.find(params[:id])
        review.update(review_params)
        render json: review
    end
    def destroy
        review = @caregiver.reviews.find(params[:id])
        review.destroy
        render json: review
    end
    
    private
    
    def review_params
        params.require(:review).permit(:parent_id, :caregiver_id, :comment)
    end
    
    def set_caregiver
        @caregiver = Caregiver.find(params[:caregiver_id])
    end
    
end
    