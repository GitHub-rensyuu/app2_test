class ApplicationController < ActionController::Base
#     devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にtop,aboutのページのみアクセス許可
   before_action :authenticate_user!, except: [:top, :about, :public_action]
   before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後aboutページへ移動
  def after_sign_in_path_for(resource)
    # flash[:notice] = "Welcome! You have signed up successfully."
    # flash[:notice] = "Signed in successfully."
    # (resource)を付ける意味？
    user_path(resource)
  end

  # サインアウト後aboutページへ移動
  def after_sign_out_path_for(resource)
    # flash[:notice] = "Signed out successfully."
    root_path
  end

  # ストロングパラメータ同様の機能
  protected
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end
end
