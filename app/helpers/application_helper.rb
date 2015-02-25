module ApplicationHelper
  class HTML < Redcarpet::Render::HTML
    # to use Rouge with Redcarpet
    include Rouge::Plugins::Redcarpet
    # overriding Redcarpet method
    # github.com/vmg/redcarpet/blob/master/lib/redcarpet/render_man.rb#L9
    def block_code(code, language)
      # highlight some code with a given language lexer 
      # and formatter: html or terminal256 
      # and block if you want to stream chunks
      # github.com/jayferd/rouge/blob/master/lib/rouge.rb#L17
      Rouge.highlight(code, language || 'text', 'html') 
      # watch out you need to provide 'text' as a default, 
      # because when you not provide language in Markdown 
      # you will get error: <RuntimeError: unknown lexer >
    end
  end

  def markdown(text)
    render_options = {
      filter_html:     false,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow' }
    }
    #renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: false)
    renderer = HTML.new(render_options)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true,
	tables: true,
	underline: true,
	highlight: true,
	quote: true
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
