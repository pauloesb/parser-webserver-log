require "simplecov"

SimpleCov.start do
  add_filter "spec"
end

require_relative "../lib/parser/models/log_line"
require_relative "../lib/parser/domains/views/most"
require_relative "../lib/parser/domains/views/page"
require_relative "../lib/parser/domains/views/unique"
require_relative "../lib/parser/domains/reader"
require_relative "../lib/parser/domains/domain"
require_relative "../lib/parser/analyzer"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec::Expectations.configuration.on_potential_false_positives = :nothing
