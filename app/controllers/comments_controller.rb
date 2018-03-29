class CommentsController < ApplicationController
    def create
        comment = Comment.new
        comment.post_id = params[:post_id]
        comment.content = params[:comment]
        comment.save
        
        redirect_to "/posts/#{params[:category_id]}/#{params[:post_id]}"
    end
    
    def destroy
        comment = Comment.find(params[:comment_id])
        post_id = comment.post_id
        comment.destroy
        
        redirect_to "/posts/#{params[:category_id]}/#{params[:post_id]}"
    end
end