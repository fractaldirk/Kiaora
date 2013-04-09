class AddDetailsToDictionaries < ActiveRecord::Migration
  def change
    add_column :dictionaries, :competency_spanish, :string
    add_column :dictionaries, :competency_french, :string
    add_column :dictionaries, :indicator, :integer
  end
end
