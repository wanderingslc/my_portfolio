class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.belongs_to :pictured, polymorphic: true
      t.attachment :image
      t.timestamps
    end
    add_index :pictures, :pictured_id
  end
end
