# frozen_string_literal: true

require_relative "domains/reader"
require_relative "domains/views/most"
require_relative "domains/views/unique"

module Parser
  module Analyzer
    module_function

    def start(file)
      Parser::Reader.run(log_file: file).tap do |log_lines|
        Parser::Views::Most.run(log_lines: log_lines)
        Parser::Views::Unique.run(log_lines: log_lines)
      end
    end
  end
end
