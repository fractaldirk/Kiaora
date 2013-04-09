class CreateLeaderships < ActiveRecord::Migration
  def change
    create_table :leaderships do |t|
      t.integer :indicator
      t.references :position

      t.timestamps
    end
    add_index :leaderships, :position_id
  end
end
