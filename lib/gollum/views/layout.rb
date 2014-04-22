require 'cgi'

module Precious
  module Views
    class Layout < Mustache
      include Rack::Utils
      alias_method :h, :escape_html

      attr_reader :name, :path

      def escaped_name
        CGI.escape(@name)
      end

      def title
        "Home"
      end

      def has_path
        !@path.nil?
      end

      def base_url
        @base_url
      end

      def css # custom css
        @css
      end

      def js # custom js
        @js
      end

      def has_flash
        ! @flashMessage.empty? || ! @flashError.empty?
      end

      def flash_class
        @flashError.empty? ? "flash-message" : "flash-error"
      end

      def flash_content
        @flashError || @flashMessage
      end

      def current_user
        @currentUser
      end

    end
  end
end
