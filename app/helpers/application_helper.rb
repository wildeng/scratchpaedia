# Application common helpers
module ApplicationHelper
  # rendering coderay syntax highlighter
  class CodeRayify < Redcarpet::Render::HTML
    # overriding RedCarpet block_code callback
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    options = {
      link_attributes: { rel: 'nofollow', target: '_blank' },
      space_after_headers: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      strikethrough: true,
      lax_html_blocks: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(coderayified, options)
    markdown.render(text).html_safe
  end
end
