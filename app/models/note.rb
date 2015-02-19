class Note < ActiveRecord::Base
	has_many :note_tags, dependent: :destroy
	has_many :tags, through: :note_tags, :class_name => 'Tag'
	accepts_nested_attributes_for :note_tags
	accepts_nested_attributes_for :tags, allow_destroy: :false, reject_if: proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
