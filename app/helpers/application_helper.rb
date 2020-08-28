# frozen_string_literal: true

# Application common helpers
module ApplicationHelper
  # rendering coderay syntax highlighter
  class CodeRayify < Redcarpet::Render::HTML
    # overriding RedCarpet block_code callback
    def block_code(code, language)
      return code if language.blank?

      CodeRay.scan(code, language).div
    end
  end

  # setting options for redcarpet and markdown
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

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(
          :div,
          message,
          class: "#{bootstrap_class_for(msg_type)}"
        ) do
          concat content_tag(
            :button,
            'x',
            class: 'close',
            data: { dismiss: 'alert' },
            aria: { label: 'Close' }
          )
          concat content_tag(
            :span,
            message,
            class: 'alert-message'
          )
        end
      )
    end
    nil
  end
end
