module Propose::Tree
  # Generic definition of a parse tree node for propositional logic.
  class Node
    # Nodes which can be considered the children of this node.
    def children
      []
    end

    # Whether this node can be considered an unambiguous single lexical unit.
    #
    # This is used to omit unnecessary parentheses when rendering.
    def literal?
      false
    end
  end
end
