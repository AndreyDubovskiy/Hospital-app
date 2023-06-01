require 'kaminari'
class KlinikasController < ApplicationController

  before_action :authenticate_user!
  def new
    @klinika = Klinika.new
  end

  def index
    @klinikas = KlinicQuery.new(Klinika.all).call(params)
    @klinikas = Kaminari.paginate_array(@klinikas).page(params[:page]).per(10)
  end

  def create
    @klinika = Klinika.new(klinika_params)
    if @klinika.save
      redirect_to @klinika
    else
      render 'new'
    end
  end

  def show
    @klinika = Klinika.find(params[:id])
    @card_pacients = CardPacientQuery.new(@klinika.card_pacients).call(params)
    @card_pacients = Kaminari.paginate_array(@card_pacients).page(params[:page])

    klinic = Klinika.find(57)
    cards = CardPacient.all
    ids = 0
    cards.each do |card|
      ids+=1

      card.klinika = klinic
      otdel = klinic.otdelenies.sample
      doctor = otdel.vraches.sample
      card.vrach = doctor
      card.save
    end


    end

  def edit
    @klinika = Klinika.find(params[:id])
  end

  def update
    @klinika = Klinika.find(params[:id])
    if @klinika.update(klinika_params)
      redirect_to @klinika
    else
      render 'edit'
    end
  end

  def destroy
    @klinika = Klinika.find(params[:id])
    @klinika.destroy

    redirect_to klinikas_path
  end

  def klinika_params
    params.require(:klinika).permit(:name, :adress)
  end
end
