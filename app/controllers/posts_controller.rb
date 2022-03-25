class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update , :show, :destroy]
  before_action :authenticate_user!, except:[:show,:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

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



  def destroy

    if can?(:delete, @post)
      @post.destroy
      flash.alert = "Deleted the post"
      redirect_to posts_path           
  else
      flash.notice = "Access denied"
      redirect_to new_session_path
  end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end


end
