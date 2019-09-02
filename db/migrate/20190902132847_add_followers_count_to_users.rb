class AddFollowersCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :instagram_followers, :string
    add_column :users, :youtube_subscribers, :string
  end
end
