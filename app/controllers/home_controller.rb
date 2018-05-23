class HomeController < ApplicationController
  def index
  end

  def regiao
  end

  def show
    render "home/#{params[:page]}"
  end
end
