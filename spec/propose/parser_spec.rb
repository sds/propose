require 'spec_helper'

describe Propose::Parser do
  describe '.parse' do
    subject { described_class.parse(code) }

    context 'with an empty string' do
      let(:code) { '' }
      it { should be_nil }
    end

    context 'with an atom' do
      let(:code) { 'p' }

      it { should == Propose::Tree::Atom.new(:p) }
    end

    context 'with an atom in brackets' do
      let(:code) { '(p)' }

      it { should == Propose::Tree::Atom.new(:p) }
    end

    context 'with a negated atom' do
      let(:code) { 'not p' }

      it { should == Propose::Tree::Negation.new(Propose::Tree::Atom.new(:p)) }
    end

    context 'with a negated atom in brackets' do
      let(:code) { '(not p)' }

      it { should == Propose::Tree::Negation.new(Propose::Tree::Atom.new(:p)) }
    end

    context 'with a symbol for true' do
      let(:code) { 'T' }

      it { should == Propose::Tree::Verum.instance }
    end

    context 'with a symbol for false' do
      let(:code) { 'F' }

      it { should == Propose::Tree::Falsum.instance }
    end

    context 'with a conjunction' do
      context 'of two atoms' do
        let(:code) { 'p and q' }

        it do
          should == Propose::Tree::Conjunction.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'contained in brackets' do
        let(:code) { '(p and q)' }

        it do
          should == Propose::Tree::Conjunction.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'of a negated atom and an atom' do
        let(:code) { 'not p and q' }

        it do
          should == Propose::Tree::Conjunction.new(
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:p)),
            Propose::Tree::Atom.new(:q))
        end
      end

      context 'of an atom and a negated atom' do
        let(:code) { 'p and not q' }

        it do
          should == Propose::Tree::Conjunction.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:q)))
        end
      end

      context 'of three atoms' do
        let(:code) { 'p and q and r' }

        it do
          should == Propose::Tree::Conjunction.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:q),
              Propose::Tree::Atom.new(:r)))
        end
      end

      context 'implying an atom' do
        let(:code) { 'p and q implies r' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Atom.new(:r))
        end
      end

      context 'implying a conjunction' do
        let(:code) { 'p and q implies r and s' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:r),
              Propose::Tree::Atom.new(:s)))
        end
      end

      context 'implying a disjunction' do
        let(:code) { 'p and q implies r or s' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:r),
              Propose::Tree::Atom.new(:s)))
        end
      end
    end

    context 'with a disjunction' do
      context 'of two atoms' do
        let(:code) { 'p or q' }

        it do
          should == Propose::Tree::Disjunction.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'contained in brackets' do
        let(:code) { '(p or q)' }

        it do
          should == Propose::Tree::Disjunction.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'of a negated atom and an atom' do
        let(:code) { 'not p or q' }

        it do
          should == Propose::Tree::Disjunction.new(
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:p)),
            Propose::Tree::Atom.new(:q))
        end
      end

      context 'of an atom and a negated atom' do
        let(:code) { 'p or not q' }

        it do
          should == Propose::Tree::Disjunction.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:q)))
        end
      end

      context 'of three atoms' do
        let(:code) { 'p or q or r' }

        it do
          should == Propose::Tree::Disjunction.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:q),
              Propose::Tree::Atom.new(:r)))
        end
      end

      context 'implying an atom' do
        let(:code) { 'p or q implies r' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Atom.new(:r))
        end
      end

      context 'implying a conjunction' do
        let(:code) { 'p or q implies r and s' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:r),
              Propose::Tree::Atom.new(:s)))
        end
      end

      context 'implying a disjunction' do
        let(:code) { 'p or q implies r or s' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:p),
              Propose::Tree::Atom.new(:q)),
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:r),
              Propose::Tree::Atom.new(:s)))
        end
      end
    end

    context 'with an implication' do
      context 'of two atoms' do
        let(:code) { 'p implies q' }

        it do
          should == Propose::Tree::Implication.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'contained in brackets' do
        let(:code) { '(p implies q)' }

        it do
          should == Propose::Tree::Implication.new(Propose::Tree::Atom.new(:p),
                                                   Propose::Tree::Atom.new(:q))
        end
      end

      context 'of a negated atom and an atom' do
        let(:code) { 'not p implies q' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:p)),
            Propose::Tree::Atom.new(:q))
        end
      end

      context 'of an atom and a negated atom' do
        let(:code) { 'p implies not q' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Negation.new(Propose::Tree::Atom.new(:q)))
        end
      end

      context 'implying another implication' do
        let(:code) { 'p implies q implies r' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Implication.new(
              Propose::Tree::Atom.new(:q),
              Propose::Tree::Atom.new(:r)))
        end
      end

      context 'implying a conjunction' do
        let(:code) { 'p implies q and r' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Conjunction.new(
              Propose::Tree::Atom.new(:q),
              Propose::Tree::Atom.new(:r)))
        end
      end

      context 'implying a disjunction' do
        let(:code) { 'p implies q or r' }

        it do
          should == Propose::Tree::Implication.new(
            Propose::Tree::Atom.new(:p),
            Propose::Tree::Disjunction.new(
              Propose::Tree::Atom.new(:q),
              Propose::Tree::Atom.new(:r)))
        end
      end
    end

    context 'with a sequent' do
      context 'containing no premises' do
        let(:code) { 'proves p' }

        it do
          should == Propose::Tree::Sequent.new([],
                                               Propose::Tree::Atom.new(:p))
        end
      end

      context 'containing a single premise' do
        let(:code) { 'p proves q' }

        it do
          should == Propose::Tree::Sequent.new([Propose::Tree::Atom.new(:p)],
                                               Propose::Tree::Atom.new(:q))
        end
      end

      context 'containing multiple premises' do
        let(:code) { 'p q proves r' }

        it do
          should == Propose::Tree::Sequent.new([Propose::Tree::Atom.new(:p),
                                                Propose::Tree::Atom.new(:q)],
                                               Propose::Tree::Atom.new(:r))
        end
      end

      context 'containing multiple premises separated by commas' do
        let(:code) { 'p, q and r proves s' }

        it do
          should == Propose::Tree::Sequent.new([Propose::Tree::Atom.new(:p),
                                                Propose::Tree::Conjunction.new(
                                                  Propose::Tree::Atom.new(:q),
                                                  Propose::Tree::Atom.new(:r))
                                               ],
                                               Propose::Tree::Atom.new(:s))
        end
      end
    end
  end
end
