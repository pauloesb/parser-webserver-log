# frozen_string_literal: true

module Parser
  class LogLine
    VALIDATOR = %r{^(/\w+)+(\s){1}(\d{1,3}\.{1}){3}(\d{1,3}){1}$}.freeze

    attr_reader :line, :uri

    def initialize(line, line_number = nil)
      @line_number = line_number
      @line = line.chomp
      @uri, = line.split

      check_line(line)
    end

    private

    def valid?(line)
      line.match?(VALIDATOR)
    end

    def check_line(line)
      raise InvalidLogLine, check_line_error_message unless valid?(line)
    end

    def check_line_error_message
      "The line number #{@line_number} with value '#{@line}' is invalid!\n"
    end
  end

  class InvalidLogLine < StandardError; end
end
