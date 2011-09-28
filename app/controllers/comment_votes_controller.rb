class CommentVotesController < ApplicationController
  # GET /comment_votes
  # GET /comment_votes.json
  def index
    @comment_votes = CommentVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_votes }
    end
  end

  # GET /comment_votes/1
  # GET /comment_votes/1.json
  def show
    @comment_vote = CommentVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_vote }
    end
  end

  # GET /comment_votes/new
  # GET /comment_votes/new.json
  def new
    @comment_vote = CommentVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_vote }
    end
  end

  # GET /comment_votes/1/edit
  def edit
    @comment_vote = CommentVote.find(params[:id])
  end

  # POST /comment_votes
  # POST /comment_votes.json
  def create
    @comment_vote = CommentVote.new(params[:comment_vote])

    respond_to do |format|
      if @comment_vote.save
        format.html { redirect_to @comment_vote, notice: 'Comment vote was successfully created.' }
        format.json { render json: @comment_vote, status: :created, location: @comment_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_votes/1
  # PUT /comment_votes/1.json
  def update
    @comment_vote = CommentVote.find(params[:id])

    respond_to do |format|
      if @comment_vote.update_attributes(params[:comment_vote])
        format.html { redirect_to @comment_vote, notice: 'Comment vote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_votes/1
  # DELETE /comment_votes/1.json
  def destroy
    @comment_vote = CommentVote.find(params[:id])
    @comment_vote.destroy

    respond_to do |format|
      format.html { redirect_to comment_votes_url }
      format.json { head :ok }
    end
  end
end
