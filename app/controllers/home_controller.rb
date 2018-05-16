class HomeController < ApplicationController
  def index
  end

  def regioes
  end

  def show
    render "home/#{params[:page]}"
  end
end
