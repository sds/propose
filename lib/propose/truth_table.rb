module Propose
  # Generates a truth table for a given propositional logic formula.
  class TruthTable
    attr_reader :formula, :evaluations

    def initialize(formula)
      @formula = formula
      @evaluations = generate(formula)
    end

    def formula_atoms
      @formula_atoms ||= AtomFinder.new(formula).atoms
    end

  private

    def generate(formula)
      assignments = generate_assignments(formula_atoms.to_a)

      assignments.map do |assignment|
        result = formula.evaluate(assignment)
        [assignment, result]
      end
    end

    def generate_assignments(atoms)
      return [{}] unless atoms && atoms.count > 0
      atom = atoms[0]
      subset = atoms[1..-1]

      sub_assignments = generate_assignments(subset)

      sub_assignments.flat_map do |sub_assign|
        [{ atom => true }.merge(sub_assign), { atom => false }.merge(sub_assign)]
      end
    end
  end
end
