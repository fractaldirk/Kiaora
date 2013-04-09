class CreateFunctionals < ActiveRecord::Migration
  def change
    create_table :functionals do |t|
      t.integer :indicator
      t.references :position

      t.timestamps
    end
    add_index :functionals, :position_id
  end
end
