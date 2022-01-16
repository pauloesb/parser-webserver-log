# frozen_string_literal: true

require_relative "page"

module Parser
  module Views
    class Most < Page
      private

      def start_message
        "> list of webpages with most page views ordered from most page views to less page views\n"
      end

      def process
        log_lines.each_with_object({}) do |log_line, views|
          views[log_line.uri] = views[log_line.uri].to_i + 1
        end
      end

      def view_type
        "visits"
      end
    end
  end
end
