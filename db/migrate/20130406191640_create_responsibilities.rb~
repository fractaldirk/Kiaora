class CreateResponsibilities < ActiveRecord::Migration
  def change
    create_table :responsibilities do |t|
      t.integer :indicator
      t.string :content
      t.references :position

      t.timestamps
    end
    add_index :responsibilities, :position_id
  end
end
