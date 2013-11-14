module Propose::Tree
  # Generic definition of a parse tree node for propositional logic.
  class Node
    # Nodes which can be considered the children of this node.
    def children
      []
    end
  end
end
