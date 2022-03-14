class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # 投稿画像のid,店の名前、画像の説明、投稿ユーザーid
      t.string:book_name
      t.text:caption
      t.integer:user_id

      t.timestamps
    end
  end
end
