class TeamsController < ApplicationController

  def index
         @users = User.where(:team_id =>current_user.team_id).where.not(id:current_user.id)

  end

  def show

  @tasks = Task.where(:user_id => params[:id])
    
  end

  def new

  end
  def create

  end
  def edit

  end
  def update

  end
  def destroy

  end


end
