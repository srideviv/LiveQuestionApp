class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def search
    @posts = Post.find(:all, :conditions => "question LIKE '%#{params[:inp]}%'")
    #@posts = Post.where("question LIKE ?","%"+(params[:inp])+"%")
    if @posts != nil
      respond_to do |format|
        format.html # search.html.erb
        format.json { render json: @posts }
      end
    end
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @user= session[:current_user_id]
    if @user != nil  #if session id is set
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @post }
      end
    else
      redirect_to :controller => "users", :action => "login" , :notice => "You have to login to post a question"
    end

  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create

     @user_id = session[:current_user_id]
     @post = Post.new()
     @post.user_id = @user_id
     @post.question = params[:post][:question]
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: session[:current_user_id] }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
