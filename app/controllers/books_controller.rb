class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  def index
    @books = Book.all
  end

  def show
    @user_buy_current_book = user_signed_in? && current_user.books.where(id: params[:id]).any?
  end

  def new
    @book = Book.new
    authorize @book
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  def edit
    authorize @book
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to :admin_page, notice: "Книга была успешно создана." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to :admin_page, notice: "Книга был успешно обновлена." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      authorize @book
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to :admin_page, notice: "Книга была успешно удалена." }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :price)
  end
end
