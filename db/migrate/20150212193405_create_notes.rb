class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.boolean :active
      t.string :name
      t.string :code
      t.integer :sort
      t.text :text

      t.timestamps
    end
  end
end
