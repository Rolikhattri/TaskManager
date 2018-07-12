class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    
    @tasks = current_user.tasks.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new()
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    
    HardWorker.perform_async(current_user.team.id, 1)
    if params[:task][:user_id].nil?
      user_id = current_user.id
    else 
      user_id = params[:task][:user_id]
    end
    @task = Task.new(:task_name => params[:task][:task_name],:user_id=> user_id, :status => false)
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: '' }
      format.json { head :no_content }
    end
  end

  def complete_task
    
    @task = Task.find(params[:task_id])
    @task.update(:status => true,:completed_at=> Time.now)
    respond_to do |format|
      
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
     
    end
  end
  def assign_task
    @assign_task = Task.new()
      
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_name, :user_id, :status)
    end
end
