# frozen_string_literal: true

module Parser
  class Domain
    def self.run(context)
      new(context).call
    end

    def initialize(context)
      @context = context
    end

    def call
      raise NoMethodError, "call method is not defined!"
    end

    protected

    attr_reader :context
  end
end
