#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "lib/parser/analyzer"

if ARGV.empty?
  warn "No file provided!"
  warn "Usage: ./parser.rb webserver.log"
  exit 1
end

begin
  log_file_name = ARGV[0]
  log_file = File.new(log_file_name)
rescue Errno::ENOENT
  warn "Unable to open file: #{log_file_name}!"
  exit 1
end
