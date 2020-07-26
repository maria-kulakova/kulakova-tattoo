class AddTitleAndTextContentToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :text_content, :text
    add_column :sections, :title, :string
  end
end
