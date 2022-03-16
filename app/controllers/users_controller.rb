class UsersController < ApplicationController

  # 詳細機能
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  # 一覧機能
  def index
  @user = current_user
  @users = User.all
  @book = Book.new
  @books = Book.all
  end

  # 編集機能
  def edit
    @user = User.find(params[:id])
    # 他ユーザーのページの場合自分のページに移動
    unless @user == current_user
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


  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:profile_image, :introduction)
  end

end

