class KlinikasController < ApplicationController
  before_action :authenticate_user!
  def new
    @klinika = Klinika.new
  end

  def index
    @klinikas = Klinika.all
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
