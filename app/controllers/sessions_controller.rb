class SessionsController < ApplicationController
  before_action :validate_parent_params, only: [:create_parent]
  
  def parent_login
      user=Parent.find_by(username:params[:username])
      if user&.authenticate(params[:password])
          session[:parent_id]=user.id
          render json: user, status: :created
      else
          render json: { error: "Invalid username or password" }, status: :unauthorized   
      end
  end

  def caregiver_login
      user=Caregiver.find_by(username:params[:username])
      if user&.authenticate(params[:password])
          session[:caregiver_id]=user.id
          render json: user, status: :created
      else
          render json: { error: "Invalid username or password" }, status: :unauthorized   
      end
  end

  def logout_parent
    session.delete(:parent_id)
    render json: { message: "Successfully logged out parent" }, status: :ok
  end

  def logout_caregiver
    session.delete(:caregiver_id)
    render json: { message: "Successfully logged out caregiver" }, status: :ok
  end
end
