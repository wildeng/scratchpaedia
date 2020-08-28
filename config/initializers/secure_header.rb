# setting up the default config
# no options set
SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=#{1.week.to_i}"
  config.x_content_type_options = "nosniff"
  config.x_download_options = "noopen"
  config.x_permitted_cross_domain_policies = "none"
  config.x_xss_protection = "1; mode=block"
  config.x_frame_options = "sameorigin"
  config.csp = {
    base_uri: %w('self'),
    block_all_mixed_content: true, # see http://www.w3.org/TR/mixed-content/
    child_src: %w('self'),
    script_src: %w('self'),
    style_src: %w(
      'unsafe-inline'
      'self'
      https://fonts.googleapis.com
      https://cdnjs.cloudflare.com
    ),
    default_src: %w('self'),
    font_src: %w(
      'self'
      https://fonts.gstatic.com
      https://cdnjs.cloudflare.com
    )
  }
end
