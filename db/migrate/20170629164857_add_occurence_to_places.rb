class AddOccurenceToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :occurence, :string
  end
end
