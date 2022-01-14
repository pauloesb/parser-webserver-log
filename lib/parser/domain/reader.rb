# frozen_string_literal: true

require_relative "../model/log_line"

module Parser
  class Reader
    def self.run(log_file)
      new(log_file).call
    end

    def call
      read
    end

    def initialize(log_file)
      check_log_file_instance(log_file)

      @line_number = 0
      @log_file = log_file
    end

    private

    def read
      @log_file.reduce([]) do |arr, parsed_log_line|
        @line_number += 1

        begin
          arr << LogLine.new(@line_number, parsed_log_line)
        rescue Parser::InvalidLogLine => e
          warn "WARN - #{e.message}"
          arr
        end
      end
    end

    def check_log_file_instance(log_file)
      raise ArgumentError, "Parameter is not a File!" unless log_file.is_a?(File)
    end
  end
end
