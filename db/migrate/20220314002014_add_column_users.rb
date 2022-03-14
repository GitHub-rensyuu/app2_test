class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :book_id, :integer
    add_column :users, :profile_image, :string
    add_column :users, :profile_image_id, :string
  end
end
