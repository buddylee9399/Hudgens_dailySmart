class SocialConnectionsController < ApplicationController
  before_action :set_social_connection, only: %i[ show edit update destroy ]

  # GET /social_connections or /social_connections.json
  def index
    @social_connections = SocialConnection.all
  end

  # GET /social_connections/1 or /social_connections/1.json
  def show
  end

  # GET /social_connections/new
  def new
    @social_connection = SocialConnection.new
  end

  # GET /social_connections/1/edit
  def edit
  end

  # POST /social_connections or /social_connections.json
  def create
    @social_connection = SocialConnection.new(social_connection_params)

    respond_to do |format|
      if @social_connection.save
        format.html { redirect_to social_connection_url(@social_connection), notice: "Social connection was successfully created." }
        format.json { render :show, status: :created, location: @social_connection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @social_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_connections/1 or /social_connections/1.json
  def update
    respond_to do |format|
      if @social_connection.update(social_connection_params)
        format.html { redirect_to social_connection_url(@social_connection), notice: "Social connection was successfully updated." }
        format.json { render :show, status: :ok, location: @social_connection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @social_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_connections/1 or /social_connections/1.json
  def destroy
    @social_connection.destroy

    respond_to do |format|
      format.html { redirect_to social_connections_url, notice: "Social connection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_connection
      @social_connection = SocialConnection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_connection_params
      params.require(:social_connection).permit(:user_id, :provider, :uid)
    end
end
