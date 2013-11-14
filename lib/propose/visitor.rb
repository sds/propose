module Propose
  # Provides basic functionality for traversing a parse tree.
  #
  # Classes which include this module can define methods such as
  # `visit_conjunction` to have the visitor visit all conjunctions in the parse
  # tree.
  module Visitor
    def visit(node)
      # Keep track of whether this block was consumed by the visitor. This
      # allows us to visit all nodes by default, but can override the behavior
      # by specifying `yield false` in a visit method, indicating that no
      # further visiting should occur for the current node's children.
      block_called = false

      block = ->(descend = :children) do
        block_called = true
        visit_children(node) if descend == :children
      end

      method = "visit_#{node_name(node)}"

      send(method, node, &block) if respond_to?(method, true)

      visit_children(node) unless block_called
    end

  private

    def visit_children(parent)
      parent.children.each { |node| visit(node) }
    end

    def node_name(node)
      klass = node.class
      @node_names ||= {}
      @node_names[klass] ||= klass.name.gsub(/.*::(.*?)$/, '\\1').downcase
    end
  end
end
