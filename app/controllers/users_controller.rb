class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin, only: [:index, :approve]
  
    def index
      @users = User.where(approved: false)
    end
  
    def approve
      @user = User.find(params[:id])
      @user.update(approved: true)
      redirect_to users_path, notice: 'User approved successfully.'
    end
  
    private
  
    def ensure_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to access this page.'
      end
    end
  end
  