class CreateImageItems < ActiveRecord::Migration[6.0]
  def change
    create_table :image_items do |t|
      t.integer :position
      t.references :section, null: false, foreign_key: true
    end
  end
end
