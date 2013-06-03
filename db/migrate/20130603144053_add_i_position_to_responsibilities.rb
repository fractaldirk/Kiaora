class AddIPositionToResponsibilities < ActiveRecord::Migration
  def change
    add_column :responsibilities, :i_position, :integer
  end
end
