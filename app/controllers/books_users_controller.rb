class BooksUsersController < ApplicationController
    before_action :authenticate_user!
  
    def buy
      book = Book.find params[:id]
      unless current_user.books.where(id: params[:id]).any?
        current_user.books << book
      end
      redirect_to book
    end
  
    def cancel
      book = Book.find params[:id]
      if current_user.books.where(id: params[:id]).any?
        current_user.books.delete book.id
      end
      redirect_to book
    end
  end
  