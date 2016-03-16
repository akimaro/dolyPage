class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :detail
      t.string :date

      t.timestamps null: false
    end
  end
end
