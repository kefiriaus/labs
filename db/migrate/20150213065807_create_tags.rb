class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.boolean :active
      t.integer :sort
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
