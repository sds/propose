module Propose::Tree
  # Declarative statement that can be either true or false.
  #
  # For example: "The sun is shining."
  class Atom < Struct.new(:name)
    def inspect
      "#<Atom #{name}>"
    end

    def to_s
      name.to_s
    end
  end
end
