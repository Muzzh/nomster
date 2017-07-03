class ChangePhotoForPictureInPhoto < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :photo, :string
    add_column :photos, :picture, :string
  end
end
