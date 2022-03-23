class ToucsController < ApplicationController
  before_action :set_touc, only: %i[ show edit update destroy ]

  # GET /toucs or /toucs.json
  def index
    @toucs = Touc.all.order("created_at DESC")
  end

  # GET /toucs/1 or /toucs/1.json
  def show
  end

  # GET /toucs/new
  def new
    @touc = Touc.new
  end

  # GET /toucs/1/edit
  def edit
  end

  # POST /toucs or /toucs.json
  def create
    @touc = Touc.new(touc_params)

    respond_to do |format|
      if @touc.save
        format.html { redirect_to touc_url(@touc), notice: "Touc was successfully created." }
        format.json { render :show, status: :created, location: @touc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @touc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toucs/1 or /toucs/1.json
  def update
    respond_to do |format|
      if @touc.update(touc_params)
        format.html { redirect_to touc_url(@touc), notice: "Touc was successfully updated." }
        format.json { render :show, status: :ok, location: @touc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @touc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toucs/1 or /toucs/1.json
  def destroy
    @touc.destroy

    respond_to do |format|
      format.html { redirect_to toucs_url, notice: "Touc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_touc
      @touc = Touc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def touc_params
      params.require(:touc).permit(:touc)
    end
end
