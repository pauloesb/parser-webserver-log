# frozen_string_literal: true

require_relative "domain/reader"
require_relative "domain/view/most"
require_relative "domain/view/unique"

module Parser
  module Analyzer
    module_function

    def start(file)
      Parser::Reader.run(file).tap do |log_lines|
        Parser::View::Most.run(log_lines)
        Parser::View::Unique.run(log_lines)
      end
    end
  end
end
