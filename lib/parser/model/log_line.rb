# frozen_string_literal: true

module Parser
  class LogLine
    VALIDATOR = %r{^(/\w+)+(\s){1}(\d{1,3}\.{1}){3}(\d{1,3}){1}$}.freeze

    attr_reader :line

    def initialize(line_number, line)
      @line_number = line_number
      @line = line.chomp

      check_line
    end

    private

    def valid?
      line.match?(VALIDATOR)
    end

    def check_line
      raise InvalidLogLine, check_line_error_message unless valid?
    end

    def check_line_error_message
      "The line number #{@line_number} with value '#{@line}' is invalid!\n"
    end
  end

  class InvalidLogLine < StandardError; end
end
