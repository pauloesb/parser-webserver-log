# frozen_string_literal: true

module Parser
  class LogLine
    VALIDATOR = %r{^(/\w+)+(\s){1}(\d{1,3}\.{1}){3}(\d{1,3}){1}$}.freeze

    attr_accessor :log_line

    def initialize(log_line)
      @log_line = log_line
    end

    def valid?
      @valid ||= log_line.match?(VALIDATOR)
    end
  end
end
