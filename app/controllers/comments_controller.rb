class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

  def create
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comments = @post.comments

     @comment = current_user.comments.build(comment_params)
     @comment.post = @post
     @new_comment = Commit.new

    authorize @comment

      if @comment.save
          flash[:notice] = "Comment was saved."
          redirect_to [@topic, @post]
      else 
          flash[:error] = "There was an error saving your comment Please try again."
          render :new
      end
  end

 def destroy
     @topic = Topic.find(params[:topic_id])
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
