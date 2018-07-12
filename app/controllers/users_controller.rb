class UsersController < ApplicationController
  def index
        @users = User.all
    end

    def show
      @user = User.find_by_id(params[:id])
    end

    def new
     
        @user = User.new()
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to user_url, notice: "Updated User."
        else
            render :edit
        end
    end

    def create
        @user = User.new(:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation],:team_id => params[:user][:team_id],:name => params[:user][:name])
        if @user.save
            redirect_to root_path, notice: "User succesfully created!" 
        else
          render :new
        end
    end






private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id, :admin, :team_lead, tasks_attributes: [:id, :task_name, :status])
end
end

