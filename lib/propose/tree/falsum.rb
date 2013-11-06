require 'singleton'

module Propose::Tree
  # Represents a contradiction, or falseness.
  class Falsum
    include Singleton

    def inspect
      '#<Falsum>'
    end

    def to_s
      '⊥'
    end
  end
end
