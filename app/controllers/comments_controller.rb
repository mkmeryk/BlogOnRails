class CommentsController < ApplicationController

    before_action :find_post

    def create
        @comment = Comment.new(params.require(:comment).permit(:body))
        # @post = Post.find params:[:comment_id]
        @comment.post = @post
        @comment.save
        if @comment.save
            redirect_to post_path(@post.id), status: 303
        else
            @comments = @post.comments
            render '/posts/show', status: 303
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        redirect_to post_path(@post.id), status: 303
    end

    private

    def find_post
        @post = Post.find params[:post_id]
    end

end
