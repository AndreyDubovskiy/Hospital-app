class SpecialsController < ApplicationController
  before_action :set_special, only: %i[ show edit update destroy ]

  # GET /specials or /specials.json
  def index
    @specials = Special.all
  end

  # GET /specials/1 or /specials/1.json
  def show
  end

  # GET /specials/new
  def new
    @special = Special.new
  end

  # GET /specials/1/edit
  def edit
  end

  # POST /specials or /specials.json
  def create
    @special = Special.new(special_params)

    respond_to do |format|
      if @special.save
        format.html { redirect_to special_url(@special), notice: "Special was successfully created." }
        format.json { render :show, status: :created, location: @special }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specials/1 or /specials/1.json
  def update
    respond_to do |format|
      if @special.update(special_params)
        format.html { redirect_to special_url(@special), notice: "Special was successfully updated." }
        format.json { render :show, status: :ok, location: @special }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specials/1 or /specials/1.json
  def destroy
    @special.destroy

    respond_to do |format|
      format.html { redirect_to specials_url, notice: "Special was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special
      @special = Special.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def special_params
      params.fetch(:special, {})
    end
end
