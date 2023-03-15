class OtdeleniesController < ApplicationController
  before_action :set_otdeleny, only: %i[ show edit update destroy ]

  # GET /otdelenies or /otdelenies.json
  def index
    @otdelenies = Otdeleny.all
  end

  # GET /otdelenies/1 or /otdelenies/1.json
  def show
  end

  # GET /otdelenies/new
  def new
    @otdeleny = Otdeleny.new
  end

  # GET /otdelenies/1/edit
  def edit
  end

  # POST /otdelenies or /otdelenies.json
  def create
    @otdeleny = Otdeleny.new(otdeleny_params)

    respond_to do |format|
      if @otdeleny.save
        format.html { redirect_to otdeleny_url(@otdeleny), notice: "Otdeleny was successfully created." }
        format.json { render :show, status: :created, location: @otdeleny }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @otdeleny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /otdelenies/1 or /otdelenies/1.json
  def update
    respond_to do |format|
      if @otdeleny.update(otdeleny_params)
        format.html { redirect_to otdeleny_url(@otdeleny), notice: "Otdeleny was successfully updated." }
        format.json { render :show, status: :ok, location: @otdeleny }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @otdeleny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /otdelenies/1 or /otdelenies/1.json
  def destroy
    @otdeleny.destroy

    respond_to do |format|
      format.html { redirect_to otdelenies_url, notice: "Otdeleny was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_otdeleny
      @otdeleny = Otdeleny.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def otdeleny_params
      params.fetch(:otdeleny, {})
    end
end
