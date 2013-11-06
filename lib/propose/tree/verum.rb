require 'singleton'

module Propose::Tree
  # Represents absolute tautological truth.
  class Verum
    include Singleton

    def inspect
      '#<Verum>'
    end

    def to_s
      '⊤'
    end
  end
end
