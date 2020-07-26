class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :widget, default: :photos_gallery 
      t.references :page, null: false, foreign_key: true
      t.integer :position
    end
  end
end
