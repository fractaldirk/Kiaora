class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :office_id
      t.integer :department
      t.date :min_update
      t.date :max_update

      t.timestamps
    end
  end
end
