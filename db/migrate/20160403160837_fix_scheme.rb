class FixScheme < ActiveRecord::Migration
  def change
    remove_column :projects, :filedata

    add_column :projects, :filename, :string
    add_column :projects, :imgfilename, :string
    
  end
end
