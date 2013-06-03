class AddLPositionToLeaderships < ActiveRecord::Migration
  def change
    add_column :leaderships, :l_position, :integer
  end
end
