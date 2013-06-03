class AddSPositionToResponsibilities < ActiveRecord::Migration
  def change
    add_column :responsibilities, :s_position, :integer
  end
end
