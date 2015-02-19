class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def taged
    @notes = Note.joins(:tags).select("notes.*, tags.name as tag_name").where(tags: {code: params[:code]})
    @tag = Tag.find_by_code(params[:code])
    respond_with(@notes)
  end

  def index
    @notes = Note.all
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def new
    @note = Note.new
    #@note.note_tags.build.build_tag
    respond_with(@note)
  end

  def edit
    #@note = Note.find(params[:id])
    #@note.note_tags.build.build_tag
  end

  def create
    @note = Note.new(note_params)
    @note.save
    respond_with(@note)
  end

  def update
    #@note.note_tags.build.build_tag
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(
	:id, :active, :name, :code, :sort, :text, 
	note_tags_attributes: [:note_id, :tag_id, :_destroy, tags_attributes: [:id, :name, :code, :_destroy]],
	note_tags: [:note_id, :tag_id, :_destroy],
	tags_attributes: [:id, :name, :code, :_destroy]
      )
    end
end
