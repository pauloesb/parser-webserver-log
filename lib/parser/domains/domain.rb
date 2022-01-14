# frozen_string_literal: true

module Parser
  class Domain
    def self.run(*kwargs)
      new(*kwargs).call
    end

    def call
      raise NoMethodError, "call method is not defined!"
    end
  end
end
