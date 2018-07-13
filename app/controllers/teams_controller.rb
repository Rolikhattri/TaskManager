class TeamsController < ApplicationController

  def index

         @users = User.where(:team_id =>current_user.team_id).where.not(id:current_user.id)
         respond_to do |format|
         format.html
         format.csv do
         headers['Content-Disposition'] = "attachment; filename=\"task-list\".csv"
         headers['Content-Type'] ||= 'csv'
    end
  end     

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
