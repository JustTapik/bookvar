class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: [:profile]

  def index
    redirect_to books_path
  end

  def profile
    @current_user = current_user
    @books = current_user.books
  end
end
