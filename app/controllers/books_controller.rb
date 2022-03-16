class BooksController < ApplicationController

  # 詳細機能
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

    # 一覧機能
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all

  end

    # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  # 編集機能
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  # 更新機能
  def update
      @book = Book.find(params[:id])
      @book.user_id = current_user.id
      if @book.update(book_params)
        flash[:notice]="You have updated book successfully."
        # @book = Book.find(params[:id])
        # @book.user_id = current_user.id
        redirect_to book_path(@book.id)
      else
        render :edit
      end
  end

  # 削除機能
def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
end


# 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :name)
  end

end