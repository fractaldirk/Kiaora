class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :competency_english

      t.timestamps
    end
  end
end
