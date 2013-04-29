class AddPositionToResponsibilities < ActiveRecord::Migration
  def change
    add_column :responsibilities, :r_position, :integer
  end
end
