class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :subreddit_select, only: [:new, :edit, :update, :create]
  # GET /posts
  # GET /posts.json
  def index
    @upvoteorder = Post.all.sort_by {|post| post.votes.count - post.downvotes.count}.reverse
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        if @post.errors[:unique_url]
          format.html { redirect_to(posts_path) }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes.create
    redirect_to(posts_path)
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvotes.create
    redirect_to(posts_path)
  end

  def voteandfetch
    @post = Post.find(params[:id])
    @post.votes.create
    redirect_to(@post.post_url)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def subreddit_select
      @subreddit_options = Subreddit.all.collect{ |subreddit| [subreddit.name, subreddit.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :summary, :post_url, :user_name, :subreddit_id)
    end
end
