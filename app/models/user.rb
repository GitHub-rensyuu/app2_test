class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

#   :database_authenticatable（パスワードの正確性を検証）
# :registerable（ユーザ登録や編集、削除）
# :recoverable（パスワードをリセット）
# :rememberable（ログイン情報を保存）
# :validatable（email のフォーマットなどのバリデーション）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # バリテーション設定
  # validates :profile_image, presence: true
  validates :name, uniqueness: true, presence: true,  length: { minimum: 2, maximum: 20}       # 「2文字以上,20文字以内」
  validates :introduction, length: { maximum: 50 }# 「50文字以内」


  # attachmentメソッドを追加
  attachment :image
  # 画像を扱えるようにする
  has_one_attached :profile_image

  # 画像の保存設定
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # booksに紐付け
  has_many :books, dependent: :destroy
end
