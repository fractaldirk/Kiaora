class CreateMethodrelations < ActiveRecord::Migration
  def change
    create_table :methodrelations do |t|
      t.integer :indicator
      t.references :position

      t.timestamps
    end
    add_index :methodrelations, :position_id
  end
end
