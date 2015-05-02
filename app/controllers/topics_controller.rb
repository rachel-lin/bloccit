class TopicsController < ApplicationController

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def new
      @topic = Topic.new
      authorize @topic
  end

      def create
      @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
        authorize @topic
        if @topic.save
          flash[:notice] = "Topic was saved."
          redirect_to @topic
        else 
          flash[:error] = "There was an error saving your topic. Please try again."
          render :new
        end
      end


  def edit
    @topic = Topic.find(params[:id])
      authorize @topic
  end

    def update
      @topic = Topic.find(params[:id])
        authorize @topic
      if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
        flash[:notice] = "Topic was updated."
        redirect_to @topic
      else 
        flash[:error] = "There was an error saving the topic. Please try again."
        render :edit
      end
    end

    def destroy

      @topic = Topic.find(params[:id])
      authorize @topic

      if @topic.destroy
        flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
        redirect_to_topics_path
      else
        flash[:error] = "There was an error deleting the topic."
        render :show
      end
    end
     
end
