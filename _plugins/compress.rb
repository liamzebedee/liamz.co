require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
=begin
  class CssCompressor < JekyllAssetPipeline::Compressor
    require 'yui/compressor'

    def self.filetype
      '.css'
    end

    def compress
      return YUI::CssCompressor.new.compress(@content)
    end
  end
#=end

  class JavaScriptCompressor < JekyllAssetPipeline::Compressor
    require 'yui/compressor'

    def self.filetype
      '.js'
    end

    def compress
      return YUI::JavaScriptCompressor.new(munge: true).compress(@content)
    end
  end

=begin
  class HTMLCompressor < JekyllAssetPipeline::Compressor
    require 'html_press'
    
    def self.filetype
      '.html'
    end
    
    def compress
      return HtmlPress.press @content
    end
  end
=end

end
