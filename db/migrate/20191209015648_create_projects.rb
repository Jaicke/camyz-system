class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :order
      t.string :name
      t.string :description
      t.text :template
      t.boolean :active

      t.timestamps
    end
  end
end
