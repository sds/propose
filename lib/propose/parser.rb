require 'treetop'

module Propose
  # Parses a propositional logic statement into an abstract syntax tree.
  class Parser
    GRAMMAR_FILE = File.expand_path(File.join(File.dirname(__FILE__),
                                              '..', '..', 'grammar',
                                              'propositional_logic.treetop'))

    class << self
      def parse(string)
        tree = parser.parse(string)
        tree.to_ast if tree
      end

    private

      def parser
        @parser ||= begin
                      Treetop.load(GRAMMAR_FILE)
                      PropositionalLogicParser.new
                    end
      end
    end
  end
end
