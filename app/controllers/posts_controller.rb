class PostsController < ApplicationController
  

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

    def create
      @topic = Topic.find(params[:topic_id])
      @post = current_user.posts.build(post_params)
      @post.topic = @topic
        authorize @post
        if @post.save
          flash[:notice] = "Post was saved."
          redirect_to [@post.topic, @post]
        else 
          flash[:error] = "There was an error saving your post. Please try again."
          render :new
        end
      end


  def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      @post.topic = @topic
      authorize @post
  end

    def update
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      @post.topic = @topic
        authorize @post
      if @post.update_attributes(post_params)
        flash[:notice] = "Post was updated."
        redirect_to [@post.topic, @post]
      else 
        flash[:error] = "There was an error saving the post. Please try again."
        render :edit
      end
    end

  def markdown_title
    @post.title.render_as_markdown
  end

  def markdown_body
    @post.body.render_as_markdown
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def render_as_markdown
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end


end
