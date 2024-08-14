class PostLinksController < ApplicationController
  before_action :set_post_link, only: %i[ show edit update destroy ]

  # GET /post_links or /post_links.json
  def index
    @post_links = PostLink.all
  end

  # GET /post_links/1 or /post_links/1.json
  def show
  end

  # GET /post_links/new
  def new
    @post_link = PostLink.new
  end

  # GET /post_links/1/edit
  def edit
  end

  # POST /post_links or /post_links.json
  def create
    @post_link = PostLink.new(post_link_params)

    respond_to do |format|
      if @post_link.save
        format.html { redirect_to post_link_url(@post_link), notice: "Post link was successfully created." }
        format.json { render :show, status: :created, location: @post_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_links/1 or /post_links/1.json
  def update
    respond_to do |format|
      if @post_link.update(post_link_params)
        format.html { redirect_to post_link_url(@post_link), notice: "Post link was successfully updated." }
        format.json { render :show, status: :ok, location: @post_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_links/1 or /post_links/1.json
  def destroy
    @post_link.destroy

    respond_to do |format|
      format.html { redirect_to post_links_url, notice: "Post link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_link
      @post_link = PostLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_link_params
      params.require(:post_link).permit(:link_url, :post_id)
    end
end
