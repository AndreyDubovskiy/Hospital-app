class CardPacientsController < ApplicationController
  before_action :authenticate_user!
  def new
    @card = CardPacient.new
  end

  def show
    @card = CardPacient.find(params[:id])
  end
  def edit
    @card = CardPacient.find(params[:id])
  end

  def update
    @card = CardPacient.find(params[:id])
    if @card.update(card_params)
      redirect_to card_pacients_path
    else
      render :edit
    end
  end

  def index
    @cards = CardPacient.all
  end

  def destroy
    @card = CardPacient.find(params[:id])
    @card.destroy
    redirect_to card_pacients_path
  end

  def create
    @card = CardPacient.new(card_params)
    if @card.save
      redirect_to card_pacients_path
    else
      render :new
    end
  end

  def card_params
    params.require(:card_pacient).permit(:adress, :diagnoz, :klinika_id)
  end
end
