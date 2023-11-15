class CaregiversController < ApplicationController
   
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid
    def index
        caregivers = Caregiver.all
        render json: caregivers
        
    end

    def show
        caregiver = caregiver_finder
        render json: caregiver
    end

    def show_caregiver
        user=Caregiver.find_by(id:session[:caregiver_id])
        render json: user, status: :created
    end
    
    def booked_by_parent
    parent_id = params[:parent_id]
    bookings = Booking.where(parent_id: parent_id)
    caregivers = bookings.map{ |booking| Caregiver.find(booking.caregiver_id) }
    render json: caregivers
  end
  

    # def handle_email
    #     caregiver = caregiver.find_by(email: params[:email])
        
    #     CaregiverMailer.with(caregiver: caregiver).forgot_password(caregiver).deliver
    # end 



    def create
        caregiver = Caregiver.create!(caregiver_params)
        if caregiver.valid?
            session[:caregiver_id] = caregiver.id
            render json: caregiver, status: :created
        end
    end
    def book
        @caregiver.update(is_booked: true)
        render json: { message: "Caregiver has been booked" }, status: :ok
    end
    def show_parent_bookings
        @caregiver = Caregiver.find(params[:id])
        @bookings = @caregiver.bookings
        render json: {bookings: @bookings}
      end
      
    def unbook
        @caregiver.update(is_booked: false)
        render json: { message: "Caregiver has been unbooked" }, status: :ok
    end


    def update
        caregiver = caregiver_finder
            caregiver.update!(caregiver_params)
            render json: caregiver
    end

    def destroy
        caregiver = caregiver_finder
        caregiver.destroy
        head :no_content
      
    end

    


    private

        def caregiver_finder
            caregiver = Caregiver.find_by(id: params[:id])
        end

        def caregiver_params
            params.permit(:avatar, :username, :password, :password_confirmation, :email, :address, :gender, :phone, :education, :experience, :is_booked, :age)
          end

        def render_not_found_response
            render json: { error: "Caregiver not found" }, status: :not_found
        end
        def rescue_record_invalid(invalid)
            render json: {errors:invalid.record.errors.full_messages}, status: :unprocessable_entity
        end

       

        
end