class CommentsController < ApplicationController
  def create

      @topic = Topic.find(params[:topic_id])
      @post = current_user.posts.build(post_params)
      @comment = current_user.comments.build(params.require(:comment).permit(:body))
      @post.topic = @topic

        authorize @comment
        if @comment.save
          flash[:notice] = "Comment was saved."
          redirect_to [@comment.post.topic, @comment]
        else 
          flash[:error] = "There was an error saving your comment. Please try again."
          render :new
        end
  end
end
