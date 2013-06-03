class AddMPositionToMethodrelations < ActiveRecord::Migration
  def change
    add_column :methodrelations, :m_position, :integer
  end
end
