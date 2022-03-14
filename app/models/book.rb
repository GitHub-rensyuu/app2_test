class Book < ApplicationRecord

    # バリテーション設定
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}

  # attachmentメソッドを追加
  attachment :profile_image
  # 画像を扱えるようにする
  # has_one_attached :profile_image
  # userに紐付け
  belongs_to :user


end
