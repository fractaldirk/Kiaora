class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.integer :indicator
      t.references :position

      t.timestamps
    end
    add_index :competencies, :position_id
  end
end
