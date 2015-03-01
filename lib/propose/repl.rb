require 'colorize'
require 'readline'
require 'terminal-table'

module Propose
  # Read-Eval-Print-Loop engine, allowing a user to interactively create
  # and explore the properties of propositional logic statements.
  class REPL
    def run
      while input = Readline.readline('> '.green, true)
        handle_input(input)
      end
    rescue SignalException # rubocop:disable HandleExceptions
      # User hit Ctrl-C; close gracefully
    end

  private

    def handle_input(input)
      input = input.strip
      interpret(input) unless input.empty?
    rescue ParseError => ex
      puts "Invalid expression: #{ex.message}".red
    end

    def interpret(input)
      statement = Parser.parse(input)

      case statement
      when Tree::Sequent
        puts statement.to_s.cyan
        # TODO: Find and display proof of sequent
      else
        print_truth_table(statement)
      end
    end

    def print_truth_table(statement)
      tt = Propose::TruthTable.new(statement)
      atoms = tt.formula_atoms.to_a
      table = create_table(statement, atoms, tt)

      puts table.to_s
                .gsub('T', 'T'.green)
                .gsub('F', 'F'.red)
                .gsub(table.title, table.title.cyan)
    end

    def create_table(statement, atoms, tt)
      table = Terminal::Table.new do |t|
        t << atoms + ['Result']
        t.add_separator
        add_truth_table_rows(t, tt)
      end

      table.title = statement.to_s

      (atoms.count + 1).times do |i|
        table.align_column(i, :center)
      end

      table
    end

    def add_truth_table_rows(table, truth_table)
      truth_table.evaluations.map do |assignment, result|
        table << assignment.values.map { |v| shorthand_value(v) } + [shorthand_value(result)]
      end
    end

    def shorthand_value(value)
      value ? 'T' : 'F'
    end
  end
end
