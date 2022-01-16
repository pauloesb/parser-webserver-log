# frozen_string_literal: true

require_relative "../domain"

module Parser
  module Views
    class Page < Domain

      def initialize(context)
        super(context)

        @log_lines = context[:log_lines]
      end

      def call
        print_start_message

        process_logs.each(&view)
      end

      protected

      attr_reader :log_lines

      def start_message
        raise NoMethodError, "start_message method is not defined!"
      end

      def process
        raise NoMethodError, "process method is not defined!"
      end

      def view_type
        raise NoMethodError, "view_type method is not defined!"
      end

      def process_logs
        process.sort_by { |uri, visits| [-1 * visits, uri] }.to_h
      end

      def print_start_message
        print("\n#{start_message}\n")
      end

      def view
        lambda do |key, value|
          print("#{key} #{value} #{view_type}\n")
        end
      end
    end
  end
end
