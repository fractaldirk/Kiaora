class AddAPositionToAttitudes < ActiveRecord::Migration
  def change
    add_column :attitudes, :a_position, :integer
  end
end
