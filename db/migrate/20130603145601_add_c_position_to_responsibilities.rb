class AddCPositionToResponsibilities < ActiveRecord::Migration
  def change
    add_column :responsibilities, :c_position, :integer
  end
end
