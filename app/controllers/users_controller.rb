class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @user = User.all       
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follower
    if params[":project_id"].present?
      session[:project_id] = params[:project_id] 
      project_id = params[:project_id]      
      if params[:member].present?      
        @users = User.where(id: ProjectsUser.where(project_id: project_id, member:true).pluck(:user_id))
      else
        @users = User.where(id: ProjectsUser.where(project_id: project_id, member:false).pluck(:user_id))
      end
      @left_users = User.where.not(id: ProjectsUser.where(project_id: project_id).pluck(:user_id))
    else
      milestone_id = params[:milestone_id]
      session[:milestone_id] = milestone_id      
      @users = Milestone.find(milestone_id).users
      @left_users = User.where.not(id: @users.pluck(:id))
    end
  end

  def add_user    
    if request.session[:project_id].present?
      project_id = session[:project_id]
      user_ids = params[:user_id]    
      if request.env["HTTP_REFERER"].include? ("member")
        user_ids.each do |uid|
          ProjectsUser.create(project_id: project_id, user_id: uid, member: true)
        end
      else
        user_ids.each do |uid|
          ProjectsUser.create(project_id: project_id, user_id: uid)
        end
      end
    else
      milestone_id = session[:milestone_id]
      user_ids = params[:user_id]
      milestone = Milestone.find(milestone_id)      
      milestone.users << User.where(id: user_ids)      
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
