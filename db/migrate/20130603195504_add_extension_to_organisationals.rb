class AddExtensionToOrganisationals < ActiveRecord::Migration
  def change
    add_column :organisationals, :extension, :string
  end
end
