require 'jekyll_asset_pipeline'
require 'jekyll-press'

=begin
require 'jekyll/localization'
Jekyll::Localization::LANGUAGES = %w[en fr]

module Jekyll
  class Page
    # restore standard paths
    %w[url destination process].each { |name|
      alias_method name, "_localization_original_#{name}"
    }
  end
end
=end
