module Propose::Tree
  # Statement indicating that a set of premises (propositional formulae) can be
  # used to prove to a conclusion (another propositional formula).
  #
  # Sequents which the premises do not prove the conclusion are called invalid.
  class Sequent < Node
    attr_reader :premises, :conclusion

    def initialize(premises, conclusion)
      @premises = premises
      @conclusion = conclusion
    end

    def ==(other)
      super || @premises == other.premises && @conclusion == other.conclusion
    end

    def children
      premises + [conclusion]
    end

    def inspect
      "#<Sequent [#{premises.map(&:inspect).join(', ')}] ⊢ #{conclusion.inspect}"
    end

    def to_s
      "#{premises.map(&:to_s).join(', ')} ⊢ #{conclusion}"
    end
  end
end
