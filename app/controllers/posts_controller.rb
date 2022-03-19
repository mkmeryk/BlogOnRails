class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update , :show, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save

      flash[:notice] = "Post created!"
      redirect_to post_path(@post.id)
    else
      render :new, status: 303
    end

  end

  def show
    # @post = Post.find params[:id]
    @commetns = @post.comments
    @comment = Comment.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def edit 
  end

  def update 
  
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit, status: 303
    end
  end


  #destroy and update does not work
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find params[:id]
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end


end
