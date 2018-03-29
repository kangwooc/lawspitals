class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end
  
  # GET /posts/:category_id/1
  # GET /posts/:category_id/1.json
  def show
    @posts = Post.find(params[:post_id])
  end
  
  # GET /posts/new
  def new
    @post = Post.new
    authorize! :create, @post
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
         redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  end

  def show_category
    # define posts related to current category
    @relatedPosts = Category.find(:category_id).posts
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end