class PasswordResetsMailer < ApplicationMailer
    # def forgot_password
    #     @parent = params[:parent]
    #     #@user = params[:user]
    #     #@url  = 'http://example.com/login'
    #     mail(to: @parent.email, subject: 'Welcome to My Awesome Site')
    #   end

    def password_reset(user)
      @user = user
    
      #@token = @parent.signed_id(purpose: 'password_reset', expires_in: 15.minutes)
  
      mail to: @user.email, subject: "Password Reset"
    end


end
