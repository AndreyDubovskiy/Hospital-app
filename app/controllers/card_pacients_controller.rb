class CardPacientsController < ApplicationController
  before_action :set_card_pacient, only: %i[ show edit update destroy ]

  # GET /card_pacients or /card_pacients.json
  def index
    @card_pacients = CardPacient.all
  end

  # GET /card_pacients/1 or /card_pacients/1.json
  def show
  end

  # GET /card_pacients/new
  def new
    @card_pacient = CardPacient.new
  end

  # GET /card_pacients/1/edit
  def edit
  end

  # POST /card_pacients or /card_pacients.json
  def create
    @card_pacient = CardPacient.new(card_pacient_params)

    respond_to do |format|
      if @card_pacient.save
        format.html { redirect_to card_pacient_url(@card_pacient), notice: "Card pacient was successfully created." }
        format.json { render :show, status: :created, location: @card_pacient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card_pacient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_pacients/1 or /card_pacients/1.json
  def update
    respond_to do |format|
      if @card_pacient.update(card_pacient_params)
        format.html { redirect_to card_pacient_url(@card_pacient), notice: "Card pacient was successfully updated." }
        format.json { render :show, status: :ok, location: @card_pacient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card_pacient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_pacients/1 or /card_pacients/1.json
  def destroy
    @card_pacient.destroy

    respond_to do |format|
      format.html { redirect_to card_pacients_url, notice: "Card pacient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_pacient
      @card_pacient = CardPacient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_pacient_params
      params.fetch(:card_pacient, {})
    end
end
