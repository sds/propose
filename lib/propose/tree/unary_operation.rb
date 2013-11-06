module Propose::Tree
  class UnaryOperation < Struct.new(:operator, :formula)
    def inspect
      "#<#{self.class.name.split('::').last} #{formula.inspect}>"
    end

    def to_s
      "#{operator.to_s}(#{formula.to_s})"
    end
  end
end
