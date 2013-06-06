class AddPlaceToDictionaries < ActiveRecord::Migration
  def change
    add_column :dictionaries, :place, :integer
  end
end
