class AddPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_photo, :string
    add_column :users, :cover_photo, :string
    add_column :users, :description, :text
  end
end
