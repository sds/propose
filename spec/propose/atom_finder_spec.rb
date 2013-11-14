require 'spec_helper'

describe Propose::AtomFinder do
  subject { described_class.new(tree) }

  context 'when parse tree contains no atoms' do
    let(:tree) { Propose::Tree::Falsum.instance }

    its(:atoms) { should be_empty }
  end

  context 'when parse tree is an atom' do
    let(:tree) { Propose::Tree::Atom.new(:p) }

    its(:atoms) { should == [tree].to_set }
  end

  context 'when parse tree contains multiple atoms' do
    let(:atom_a) { Propose::Tree::Atom.new(:a) }
    let(:atom_b) { Propose::Tree::Atom.new(:b) }
    let(:tree) { Propose::Tree::Conjunction.new(atom_a, atom_b) }

    its(:atoms) { should == [atom_a, atom_b].to_set }
  end

  context 'when parse tree contains duplicate atoms' do
    let(:atom) { Propose::Tree::Atom.new(:a) }
    let(:tree) { Propose::Tree::Conjunction.new(atom, atom) }

    its(:atoms) { should == [atom].to_set }
  end
end
