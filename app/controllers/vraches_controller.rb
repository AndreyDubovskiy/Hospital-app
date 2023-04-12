class VrachesController < ApplicationController
  def new
    @vrach = Vrach.new
  end

  def show
    @vrach = Vrach.find(params[:id])
  end
  def edit
    @vrach = Vrach.find(params[:id])
  end

  def update
    @vrach = Vrach.find(params[:id])
    if @vrach.update(vrach_params)
      redirect_to vraches_path
    else
      render :edit
    end
  end

  def index
    @vraches = Vrach.all
  end

  def destroy
    @vrach = Vrach.find(params[:id])
    @vrach.destroy
    redirect_to vraches_path
  end

  def create
    @vrach = Vrach.new(vrach_params)
    if @vrach.save
      redirect_to vraches_path
    else
      render :new
    end
  end

  def vrach_params
    params.require(:vrach).permit(:name, :special_id, :otdelenie_id)
  end
end
