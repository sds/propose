require 'set'

module Propose
  # Finds all atoms in a parse tree.
  class AtomFinder
    include Propose::Visitor

    attr_reader :atoms

    def initialize(formula)
      @atoms = Set.new
      visit(formula)
    end

    def visit_atom(atom)
      @atoms << atom
    end
  end
end
