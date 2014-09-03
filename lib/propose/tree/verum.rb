require 'singleton'

module Propose::Tree
  # Represents absolute tautological truth.
  class Verum < Node
    include Singleton

    def evaluate(_assignment)
      true
    end

    def literal?
      true
    end

    def inspect
      '#<Verum>'
    end

    def to_s
      '⊤'
    end
  end
end
