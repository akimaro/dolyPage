class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :year
      t.string :name
      t.string :filename
      t.string :researcher
      t.string :imgfilename

      t.timestamps null: false
    end
  end
end
