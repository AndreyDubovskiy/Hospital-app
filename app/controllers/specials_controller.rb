class SpecialsController < ApplicationController

  def new
    @spec = Special.new
  end

  def show
    @spec = Special.find(params[:id])
  end
  def edit
    @spec = Special.find(params[:id])
  end

  def update
    @spec = Special.find(params[:id])
    if @spec.update(special_params)
      redirect_to specials_path
    else
      render :edit
    end
  end

  def index
    @spec = Special.all
  end

  def destroy
    @spec = Special.find(params[:id])
    @spec.destroy
    redirect_to specials_path
  end

  def create
    @spec = Special.new(special_params)
    if @spec.save
      redirect_to specials_path
    else
      render :new
    end
  end

  def special_params
    params.require(:special).permit(:name)
  end
end
