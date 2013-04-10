class AddDetailsToMethodrelations < ActiveRecord::Migration
  def change
    add_column :methodrelations, :value, :integer
    add_column :methodrelations, :importance, :integer
  end
end
