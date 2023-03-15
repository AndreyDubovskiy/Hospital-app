class KlinikasController < ApplicationController
  before_action :set_klinika, only: %i[ show edit update destroy ]

  # GET /klinikas or /klinikas.json
  def index
    @klinikas = Klinika.all
  end

  # GET /klinikas/1 or /klinikas/1.json
  def show
  end

  # GET /klinikas/new
  def new
    @klinika = Klinika.new
  end

  # GET /klinikas/1/edit
  def edit
  end

  # POST /klinikas or /klinikas.json
  def create
    @klinika = Klinika.new(klinika_params)

    respond_to do |format|
      if @klinika.save
        format.html { redirect_to klinika_url(@klinika), notice: "Klinika was successfully created." }
        format.json { render :show, status: :created, location: @klinika }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @klinika.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klinikas/1 or /klinikas/1.json
  def update
    respond_to do |format|
      if @klinika.update(klinika_params)
        format.html { redirect_to klinika_url(@klinika), notice: "Klinika was successfully updated." }
        format.json { render :show, status: :ok, location: @klinika }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @klinika.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klinikas/1 or /klinikas/1.json
  def destroy
    @klinika.destroy

    respond_to do |format|
      format.html { redirect_to klinikas_url, notice: "Klinika was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klinika
      @klinika = Klinika.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def klinika_params
      params.fetch(:klinika, {})
    end
end
