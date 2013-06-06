class AddPlaceToOrganisationals < ActiveRecord::Migration
  def change
    add_column :organisationals, :place, :integer
  end
end
