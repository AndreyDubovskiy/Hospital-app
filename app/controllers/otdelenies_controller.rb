class OtdeleniesController < ApplicationController
  before_action :authenticate_user!
  def new
    @otdelenie = Otdelenie.new
  end

  def show
    @otdelenie = Otdelenie.find(params[:id])
  end
  def edit
    @otdelenie = Otdelenie.find(params[:id])
  end

  def update
    @otdelenie = Otdelenie.find(params[:id])
    if @otdelenie.update(otdelenie_params)
      redirect_to otdelenies_path
    else
      render :edit
    end
  end

  def index
    @otdelenies = Otdelenie.all
  end

  def destroy
    @otdelenie = Otdelenie.find(params[:id])
    @otdelenie.destroy
    redirect_to otdelenies_path
  end

  def create
    @otdelenie = Otdelenie.new(otdelenie_params)
    if @otdelenie.save
      redirect_to otdelenies_path
    else
      render :new
    end
  end

  def otdelenie_params
    params.require(:otdelenie).permit(:name, :klinika_id)
  end
end
