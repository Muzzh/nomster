class RmAvatarAddPhotoToPhotos < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :avatar, :string
    add_column :photos, :photo, :string
  end
end
