class CreateNoteTags < ActiveRecord::Migration
  def change
    create_table :note_tags, id: false do |t|
	t.references :note, null: false
	t.references :tag, null: false
	t.index [:note_id, :tag_id]
    end
  end
end
