require 'treetop'

module Propose
  # Raised when the parser is unable to parse the input.
  class ParseError < StandardError; end

  # Parses a propositional logic statement into an abstract syntax tree.
  class Parser
    GRAMMAR_FILE = File.expand_path(File.join(File.dirname(__FILE__),
                                              '..', '..', 'grammar',
                                              'propositional_logic.treetop'))

    class << self
      def parse(string)
        tree = parser.parse(string)
        raise ParseError, parser.failure_reason unless tree

        tree.to_ast
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
