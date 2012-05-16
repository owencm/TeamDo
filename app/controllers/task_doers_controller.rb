class TaskDoersController < ApplicationController
  # GET /task_doers
  # GET /task_doers.json
  def index
    @task_doers = TaskDoer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_doers }
    end
  end

  # GET /task_doers/1
  # GET /task_doers/1.json
  def show
    @task_doer = TaskDoer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_doer }
    end
  end

  # GET /task_doers/new
  # GET /task_doers/new.json
  def new
    @task_doer = TaskDoer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_doer }
    end
  end

  # GET /task_doers/1/edit
  def edit
    @task_doer = TaskDoer.find(params[:id])
  end

  # POST /task_doers
  # POST /task_doers.json
  def create
    @task_doer = TaskDoer.new(params[:task_doer])

    respond_to do |format|
      if @task_doer.save
        format.html { redirect_to @task_doer, notice: 'Task doer was successfully created.' }
        format.json { render json: @task_doer, status: :created, location: @task_doer }
      else
        format.html { render action: "new" }
        format.json { render json: @task_doer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_doers/1
  # PUT /task_doers/1.json
  def update
    @task_doer = TaskDoer.find(params[:id])

    respond_to do |format|
      if @task_doer.update_attributes(params[:task_doer])
        format.html { redirect_to @task_doer, notice: 'Task doer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_doer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_doers/1
  # DELETE /task_doers/1.json
  def destroy
    @task_doer = TaskDoer.find(params[:id])
    @task_doer.destroy

    respond_to do |format|
      format.html { redirect_to task_doers_url }
      format.json { head :no_content }
    end
  end
end
