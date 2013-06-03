class AddCPositionToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :c_position, :integer
  end
end
