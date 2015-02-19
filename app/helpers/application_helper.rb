#require 'kramdown'
module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def top_menu
    Tag.all.order(:sort)
  end

#	def kramdown(text)
#		options = {
#			
#		}
#		Kramdown::Document.new(text, options).to_html
#	end
end
