class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.boolean :public
      t.integer :status
      t.text :url
      t.integer :mode
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
  end
end
