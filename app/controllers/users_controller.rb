class UsersController < ApplicationController

  # 詳細機能
  def show
    # idのユーザー定義
    @user = User.find(params[:id])
    # 本の新規データ定義
    @book = Book.new
    # ユーザーの本を定義
    @books = Book.where(user_id: @user.id)
  end

  def index
  # ユーザー定義
  @user = current_user
  # データベース定義
  @users = User.all
  # 新規データ定義
  @book = Book.new
  # データベース定義
  @books = Book.all
  # @user = User.find(params[:id])
  # # @userが持っているbooksを@booksに渡す
  # @books = @user.books
  end



  def edit
    # idのユーザーを定義
    @user = User.find(params[:id])
    # 他ユーザーのページの場合自分のページに移動
    unless @user == current_user

      # 現在のユーザーのshowページにリンク
      redirect_to user_path(current_user)
    end
  end

  # 更新機能
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)

    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image, :introduction)
  end

end

