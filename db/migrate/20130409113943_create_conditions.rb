class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :environment
      t.references :position

      t.timestamps
    end
    add_index :conditions, :position_id
  end
end
