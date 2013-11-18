module Propose::Tree
  # Declarative statement that can be either true or false.
  #
  # For example: "The sun is shining."
  class Atom < Node
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def ==(other)
      super || @name == other.name
    end

    def evaluate(assignment)
      assignment[self]
    end

    def literal?
      true
    end

    def inspect
      "#<Atom #{name}>"
    end

    def to_s
      name.to_s
    end
  end
end
