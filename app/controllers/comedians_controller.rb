class ComediansController < ApplicationController
  def index
    @comedians = params[:age] ? Comedian.by_age(params[:age]) : Comedian.all
    @avg_age = @comedians.avg_age
    @locations = @comedians.locations
    @total_specials = @comedians.count_of_specials
    @average_specials = @comedians.average_of_specials
  end

  def new
    @comedians = Comedian.new
  end

  def create
    comedian = Comedian.new(comedian_params)
    comedian.save
    redirect_to '/comedians'
  end

  def show
    @comedian = Comedian.find(params[:id])
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace, :image_url)
  end
end
