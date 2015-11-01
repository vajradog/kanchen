class PostsController < ApplicationController
  before_filter :authenticate
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at ASC')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
     respond_to do |format|
        format.html { redirect_to @post}
        format.json { render json: @post }
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end


  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "dharma" && password == "chakra"
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :title, :translation, :content)
    end
end
