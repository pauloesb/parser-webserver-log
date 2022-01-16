# frozen_string_literal: true

require "set"
require_relative "page"

module Parser
  module Views
    class Unique < Page
      private

      def start_message
        "> list of webpages with most unique page views also ordered\n"
      end

      def process
        raw_unique_log_lines.each_with_object({}) do |log_line, views|
          views[log_line.uri] = views[log_line.uri].to_i + 1
        end
      end

      def view_type
        "unique views"
      end

      def raw_unique_log_lines
        Set.new(log_lines.map(&:line)).map do |line|
          LogLine.new(line)
        end
      end
    end
  end
end
