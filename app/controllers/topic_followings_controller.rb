class TopicFollowingsController < ApplicationController
  before_action :set_topic_following, only: %i[ show edit update destroy ]

  # GET /topic_followings or /topic_followings.json
  def index
    @topic_followings = TopicFollowing.all
  end

  # GET /topic_followings/1 or /topic_followings/1.json
  def show
  end

  # GET /topic_followings/new
  def new
    @topic_following = TopicFollowing.new
  end

  # GET /topic_followings/1/edit
  def edit
  end

  # POST /topic_followings or /topic_followings.json
  def create
    @topic_following = TopicFollowing.new(topic_following_params)

    respond_to do |format|
      if @topic_following.save
        format.html { redirect_to topic_following_url(@topic_following), notice: "Topic following was successfully created." }
        format.json { render :show, status: :created, location: @topic_following }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic_following.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topic_followings/1 or /topic_followings/1.json
  def update
    respond_to do |format|
      if @topic_following.update(topic_following_params)
        format.html { redirect_to topic_following_url(@topic_following), notice: "Topic following was successfully updated." }
        format.json { render :show, status: :ok, location: @topic_following }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic_following.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topic_followings/1 or /topic_followings/1.json
  def destroy
    @topic_following.destroy

    respond_to do |format|
      format.html { redirect_to topic_followings_url, notice: "Topic following was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic_following
      @topic_following = TopicFollowing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_following_params
      params.require(:topic_following).permit(:topic_id, :user_id)
    end
end
