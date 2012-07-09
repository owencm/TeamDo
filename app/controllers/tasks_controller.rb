class TasksController < ApplicationController
  def name
    return "tasks"
  end
  
  #load_and_authorize_resource #automatically authorize all actions in a RESTful style resource controller. Uses a before filter to load the resource into an instance variable and authorize it for every action.

  #Catch unauthorized requests
  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id]) # this is loaded automatically by cancan
    @setter = @task.setter
    @doers = @task.doers
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    if !params[:doer].nil? 
      @task.doers = [User.find(params[:doer])] 
    end
    @group_id = params[:group]
    @group = Group.find(params[:group])
    @task.group = @group
    @group_users = @group.users

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @group = @task.group
    @group_id = @group.id
    @group_users = @group.users
  end

  # POST /tasks
  # POST /tasks.json
  def create
    if !session[:user].nil?
      params[:task][:setter_id] = session[:user]
      params[:task][:due_by] = DateTime.parse(params[:task][:due_by])
      params[:task][:doers] = params[:task][:doers].split(",").collect {|id| User.find(id)}
      params[:task][:group] = Group.find(params[:task][:group])
      @task = Task.new(params[:task])
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task.group, notice: 'The task was successfully assigned.' }
          format.json { render json: @task, status: :created, location: @task }
        else
          format.html { render action: "new" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render action: "new", notice: 'Please log in before assigning a task.' }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    params[:task][:due_by] = DateTime.parse(params[:task][:due_by])
    params[:task][:doers] = params[:task][:doers].split(",").collect {|id| User.find(id)}
    params[:task][:group] = Group.find(params[:task][:group])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task.group, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def complete
    @task = Task.find(params[:task_id])
    @task.completed_at = Date.today
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.group, notice: 'Task was marked as completed.' }
        format.json { render json: @task.group }
      else
        format.html { redirect_to @task.group, notice: 'An error occured marking the task as completed.' }
        format.json { render json: @task.group }
      end
    end
  end        
end
