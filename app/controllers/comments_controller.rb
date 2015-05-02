class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

  def create
     @post = @topic.posts.find(params[:post_id])
     @comment = Comment.new(params.require(:comment).permit(:body))
    authorize @comment
    authorize @post
      if @comment.save
          flash[:notice] = "Comment was saved."
          redirect_to [@topic, @post]
      else 
          flash[:error] = "There was an error saving your comment Please try again."
          render :new
      end
  end

 def destroy
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
end
