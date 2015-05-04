class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :name
      t.string :description
      t.integer :slide_type
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :slides, :projects
  end
end
