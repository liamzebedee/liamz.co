require 'jekyll_asset_pipeline'

# LESS to CSS
# Recognises .less files only
module JekyllAssetPipeline
  class LessConverter < JekyllAssetPipeline::Converter
    
    # Loads some libraries with error checking
    def setup
      return if @setup
      require 'less'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing the library required for less. Please run:'
      STDERR.puts ' $ [sudo] gem install less'
      raise FatalException.new("Missing dependency: less")
    end
    
    def self.filetype
      ".less"
    end
    
    def convert
      setup
      begin
        parser = Less::Parser.new :relativeUrls => true
        tree = parser.parse(@content)
        tree.to_css
      rescue => e
        puts "Less Exception: #{e.message}"
      end
    end
  end
end
