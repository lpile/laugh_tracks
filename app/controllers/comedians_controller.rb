class ComediansController < ApplicationController
  def index
    age = params[:age]
    age.nil? ? @comedians = Comedian.all : @comedians = Comedian.where(age: age)
  end
end
