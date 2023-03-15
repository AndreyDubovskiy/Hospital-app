class VrachesController < ApplicationController
  before_action :set_vrach, only: %i[ show edit update destroy ]

  # GET /vraches or /vraches.json
  def index
    @vraches = Vrach.all
  end

  # GET /vraches/1 or /vraches/1.json
  def show
  end

  # GET /vraches/new
  def new
    @vrach = Vrach.new
  end

  # GET /vraches/1/edit
  def edit
  end

  # POST /vraches or /vraches.json
  def create
    @vrach = Vrach.new(vrach_params)

    respond_to do |format|
      if @vrach.save
        format.html { redirect_to vrach_url(@vrach), notice: "Vrach was successfully created." }
        format.json { render :show, status: :created, location: @vrach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vrach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vraches/1 or /vraches/1.json
  def update
    respond_to do |format|
      if @vrach.update(vrach_params)
        format.html { redirect_to vrach_url(@vrach), notice: "Vrach was successfully updated." }
        format.json { render :show, status: :ok, location: @vrach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vrach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vraches/1 or /vraches/1.json
  def destroy
    @vrach.destroy

    respond_to do |format|
      format.html { redirect_to vraches_url, notice: "Vrach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vrach
      @vrach = Vrach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vrach_params
      params.fetch(:vrach, {})
    end
end
