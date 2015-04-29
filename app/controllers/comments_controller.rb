class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    authorize @comment
      if @comment.save
          flash[:notice] = "Comment was saved."
          redirect_to [@comment.post, @comment]
      else 
          flash[:error] = "There was an error saving your comment Please try again."
          render :new
      end
  end
end
