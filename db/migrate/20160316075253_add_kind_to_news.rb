class AddKindToNews < ActiveRecord::Migration
  def change
    add_column :news, :kind, :integer
  end
end
