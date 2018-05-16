class HomeController < ApplicationController
  def index
  end

  def regiao
#    render "regiao/"
  end

  def show
    render "home/#{params[:page]}"
  end
end
