require 'jekyll'

module Jekyll
  module Asciinema
    class AsciicastTag < Liquid::Tag
      def render(context)
        if tag_contents = parse_tag(@markup.strip)
          asciicast_id = tag_contents[0]
          render_tag(asciicast_id)
        else
          raise ArgumentError.new <<-EOS.gsub(/^ {12}/, '')
            Syntax error in tag 'asciicast' while parsing the following markup:

              #{@markup}

            Valid syntax:
              {% asciicast 123456 %}
          EOS
        end
      end

      private

      def parse_tag(input)
        matched = input.match(/\A\s*'?(\w+)'?\s*\Z/)
        [matched[1].strip] if matched && matched.length >= 2
      end

      def render_tag(asciicast_id)
         %Q{<script src="https://asciinema.org/a/#{asciicast_id}.js" id="asciicast-#{asciicast_id}" async="async"></script>}
      end
    end
  end
end

Liquid::Template.register_tag('asciicast', Jekyll::Asciinema::AsciicastTag)
