class VoteCountsController < ApplicationController
  before_action :set_vote_count, only: %i[ show edit update destroy ]

  # GET /vote_counts or /vote_counts.json
  def index
    @vote_counts = VoteCount.all
  end

  # GET /vote_counts/1 or /vote_counts/1.json
  def show
  end

  # GET /vote_counts/new
  def new
    @vote_count = VoteCount.new
  end

  # GET /vote_counts/1/edit
  def edit
  end

  # POST /vote_counts or /vote_counts.json
  def create
    @vote_count = VoteCount.new(vote_count_params)

    respond_to do |format|
      if @vote_count.save
        format.html { redirect_to vote_count_url(@vote_count), notice: "Vote count was successfully created." }
        format.json { render :show, status: :created, location: @vote_count }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_counts/1 or /vote_counts/1.json
  def update
    respond_to do |format|
      if @vote_count.update(vote_count_params)
        format.html { redirect_to vote_count_url(@vote_count), notice: "Vote count was successfully updated." }
        format.json { render :show, status: :ok, location: @vote_count }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_counts/1 or /vote_counts/1.json
  def destroy
    @vote_count.destroy

    respond_to do |format|
      format.html { redirect_to vote_counts_url, notice: "Vote count was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_count
      @vote_count = VoteCount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_count_params
      params.require(:vote_count).permit(:number_of_votes, :post_id)
    end
end
