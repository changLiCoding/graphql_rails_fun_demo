class AddBannerPicUserPicBioToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :banner_picture, :string
    add_column :users, :user_picture, :string
    add_column :users, :bio, :string
  end
end
