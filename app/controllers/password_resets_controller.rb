class PasswordResetsController < ApplicationController
  def new
  end

  def forgot
    user = Parent.find_by(email: params[:_json])
    if user
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
      user.send_password_reset
    else
      #will edit this back so that same alert sends regardless of whether there's an email in database for security reasons
      render json: {
        alert: "no such email but If this user exists, we have sent you a password reset email ."
      }
    end
  end



  def reset
    user = Parent.find_by(password_reset_token: params[:password_reset_token], email: params[:email])
    if user.present? && user.password_token_valid?
      if user.reset_password(params[:password])
        # render json: {
        #   alert: "Your password has been successfuly reset!"
        # }
        session[:parent_id] = user.id
        render json: user
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
  
    end
  end

end

#   def edit
#     @parent = Parent.find_signed!(params[:token], purpose: 'password_reset')
#   rescue ActiveSupport::MessageVerifier::InvalidSignature
#     redirect_to '/login', alert: 'Your token has expired. Please try again'
#   end

#   def update
#     @parent = Parent.find_signed!(params[:token], purpose: 'password_reset')
#     if @parent.update(password_params)
#       redirect_to '/login', notice: 'Your password was reset succesfully. Please sign in.'
#     else
#       render 'edit'
#     end
#   rescue ActiveSupport::MessageVerifier::InvalidSignature
#     redirect_to '/login', alert: 'Your token has expired. Please try again'
#   end
# end
# private

# def password_params
#   params.permit(:password, :password_confirmation)
# end

  # #how to do for both parent and caregiver
  # def create
  #   # if @parent = Parent.find_by_email(params[:email])
  #   #   PasswordResetsMailer.with(parent: @parent).reset.deliver_later
  #   # end
  #   if parent
  #     render json: {
  #       alert: "If this user exists in our database, we have sent you a password reset email."
  #     }
  #     parent.send_password_reset
  #   else
  #     #this sends regardless of whether there's an email in database for security reasons
  #     render json: {
  #       alert: "If this user exists in our database, we have sent you a password reset email."
  #     }
  #   end
  #   #redirect to appropriate view
  #   #redirect_to '/login', notice: 'If an account with that email was    found, we have sent a link to reset password'
  # end
