class AdminController < ApplicationController
    def index
      @books = Book.all
      authorize Book, policy_class: AdminPolicy
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
    end
  end
  