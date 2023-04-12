class PacientsController < ApplicationController
  def new
    @pacient = Pacient.new
  end

  def show
    @pacient = Pacient.find(params[:id])
  end
  def edit
    @pacient = Pacient.find(params[:id])
  end

  def update
    @pacient = Pacient.find(params[:id])
    if @pacient.update(pacient_params)
      redirect_to pacients_path
    else
      render :edit
    end
  end

  def index
    @pacients = Pacient.all
  end

  def destroy
    @pacient = Pacient.find(params[:id])
    @pacient.destroy
    redirect_to pacients_path
  end

  def create
    @pacient = Pacient.new(pacient_params)
    if @pacient.save
      redirect_to pacients_path
    else
      render :new
    end
  end

  def pacient_params
    params.require(:pacient).permit(:name, :card_pacient_id)
  end
end
