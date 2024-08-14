class PostSocialSharesController < ApplicationController
  before_action :set_post_social_share, only: %i[ show edit update destroy ]

  # GET /post_social_shares or /post_social_shares.json
  def index
    @post_social_shares = PostSocialShare.all
  end

  # GET /post_social_shares/1 or /post_social_shares/1.json
  def show
  end

  # GET /post_social_shares/new
  def new
    @post_social_share = PostSocialShare.new
  end

  # GET /post_social_shares/1/edit
  def edit
  end

  # POST /post_social_shares or /post_social_shares.json
  def create
    @post_social_share = PostSocialShare.new(post_social_share_params)

    respond_to do |format|
      if @post_social_share.save
        format.html { redirect_to post_social_share_url(@post_social_share), notice: "Post social share was successfully created." }
        format.json { render :show, status: :created, location: @post_social_share }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_social_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_social_shares/1 or /post_social_shares/1.json
  def update
    respond_to do |format|
      if @post_social_share.update(post_social_share_params)
        format.html { redirect_to post_social_share_url(@post_social_share), notice: "Post social share was successfully updated." }
        format.json { render :show, status: :ok, location: @post_social_share }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_social_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_social_shares/1 or /post_social_shares/1.json
  def destroy
    @post_social_share.destroy

    respond_to do |format|
      format.html { redirect_to post_social_shares_url, notice: "Post social share was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_social_share
      @post_social_share = PostSocialShare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_social_share_params
      params.require(:post_social_share).permit(:post_id, :provider)
    end
end
