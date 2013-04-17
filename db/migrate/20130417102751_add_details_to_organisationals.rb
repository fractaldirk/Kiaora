class AddDetailsToOrganisationals < ActiveRecord::Migration
  def change
    add_column :organisationals, :english, :string
    add_column :organisationals, :french, :string
    add_column :organisationals, :spanish, :string
  end
end
