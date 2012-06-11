
class FrontController < ApplicationController
  def index
    session[:user]=0
  end
end
