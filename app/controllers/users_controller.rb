class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def login
    respond_to do  |format|
      format.html #login.html.erb
    end
  end
  # GET /users/login
  # GET /users/login.json
  def signIn
    @user = User.find_by_uname(params[:uname])
    if @user == nil || !@user.authenticate(params[:uname], params[:password])
      redirect_to :action => "login", :notice => "Unable to log in to the system. Please check your credentials"
    elsif @user.authenticate(params[:uname], params[:password])
      session[:current_user_id] = @user.id
      redirect_to @user
    end

  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @sessionname = session[:current_user_id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def search
      @users = User.find_all_by_name(params[:inp])
      if @users != nil
        respond_to do |format|
          format.html #search.html.erb
          format.json { render json: @users }
        end
      end
    #elsif (params[:search]== 'post')
          #redirect_to :controller => "posts", :action => "search"
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
