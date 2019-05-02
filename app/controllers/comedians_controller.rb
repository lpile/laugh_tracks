class ComediansController < ApplicationController
  def index
    age = params[:age]
    age.nil? ? @comedians = Comedian.all : @comedians = Comedian.where(age: age)
  end

  def new
    @comedians = Comedian.new
  end

  def create
    Comedian.create(comedian_params)
    redirect_to '/comedians'
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace, :image_url)
  end
end
