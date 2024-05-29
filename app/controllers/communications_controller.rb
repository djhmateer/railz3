class CommunicationsController < ApplicationController
  before_action :set_communication, only: %i[ show edit update destroy ]

  # GET /communications or /communications.json
  def index
    @communications = Communication.all
  end

  # GET /communications/1 or /communications/1.json
  def show
  end

  # GET /communications/new
  def new
    @communication = Communication.new
  end

  # GET /communications/1/edit
  def edit
  end

  # POST /communications or /communications.json
  def create
    @communication = Communication.new(communication_params)

    respond_to do |format|
      if @communication.save
        format.html { redirect_to communication_url(@communication), notice: "Communication was successfully created." }
        format.json { render :show, status: :created, location: @communication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communications/1 or /communications/1.json
  def update
    respond_to do |format|
      if @communication.update(communication_params)
        format.html { redirect_to communication_url(@communication), notice: "Communication was successfully updated." }
        format.json { render :show, status: :ok, location: @communication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communications/1 or /communications/1.json
  def destroy
    @communication.destroy!

    respond_to do |format|
      format.html { redirect_to communications_url, notice: "Communication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication
      @communication = Communication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def communication_params
      params.require(:communication).permit(:name, :image)
    end
end
