# Propose

[![Gem Version](https://badge.fury.io/rb/propose.svg)](http://badge.fury.io/rb/propose)
[![Build Status](https://travis-ci.org/sds/propose.svg)](https://travis-ci.org/sds/propose)
[![Code Climate](https://codeclimate.com/github/sds/propose.png)](https://codeclimate.com/github/sds/propose)
[![Inline Docs](http://inch-ci.org/github/sds/propose.svg?branch=master)](http://inch-ci.org/github/sds/propose)
[![Dependency Status](https://gemnasium.com/sds/propose.svg)](https://gemnasium.com/sds/propose)

**Propose** is a playground for creating, manipulating, and verifying
statements in [propositional logic](https://en.wikipedia.org/wiki/Propositional_calculus).

It comes with a simple command-line [REPL](https://en.wikipedia.org/wiki/REPL)
`propose`, which can answer questions about propositional statements.

* [Requirements](#requirements)
* [Installation](#installation)
* [Writing Formulas](#writing-formulas)
* [Commands](#commands)
* [License](#license)

## Requirements

Ruby 2.0.0+

## Installing

```bash
gem install propose
```

## Writing Formulas

You can write formulas with **Propose** in plain English (e.g. `p or q`), or
use the standard propositional calculus notation (e.g. `p ∨ q`), amongst a few
other options outlined below.

### Atoms

Atoms are the basic unit of propositional logic, and represent a single
statement which can be true or false, like "The sun is shining." They can be
written in one or more lowercase letters.

```
> p
> q
> ball
```

### Negation (¬)

The negation of an atom expresses that the statement is _not_ true. Negation
can also be applied to larger expressions.

```
> not p
> ¬p
> !p
```

### Conjunction (∧)

The conjunction of two expressions denotes that both expressions are true.

```
> p and q
> p ∧ q
> p & q
```

### Disjunction (∨)

The disjunction of two expressions denotes that at least one of the expressions
is true.

```
> p or q
> p ∨ q
> p | q
```

### Implication (→)

Implication expresses the concept that the expression on the right is a logical
consequence of the expression on the left, e.g. "*if* the sun is shining,
*then* the ice is melting".

```
> p implies q
> p imply q
> p → q
> p -> q
> p => q
```

### Parentheses

You can write arbitrarily complex formulas by using parentheses to nest
expressions.

```
> p or (q and r)
> (p or q) implies (q or r)
> not (p and q)
```

### Binding Priorities

For convenience, you can avoid writing unnecessary parentheses by adhering to
the conventions below:

* ¬ binds more tightly than ∧, meaning ¬p ∧ q denotes (¬p) ∧ q
* ∧ binds more tightly than ∨, meaning p ∧ q ∨ r denotes (p ∧ q) ∨ r
* ∨ binds more tightly than →, meaning p ∨ q → q ∨ r denotes (p ∨ q) → (q ∨ r)
* → is _right-associative_, meaning p → q → r denotes p → (q → r)

## Commands

To print out a truth table for a propositional formula, simply enter the
formula as a command.

```
> not p or q and r
+---+---+---+--------+
|    ¬p ∨ (q ∧ r)    |
+---+---+---+--------+
| p | q | r | Result |
+---+---+---+--------+
| T | T | T |   T    |
| F | T | T |   T    |
| T | F | T |   F    |
| F | F | T |   T    |
| T | T | F |   F    |
| F | T | F |   T    |
| T | F | F |   F    |
| F | F | F |   T    |
+---+---+---+--------+
```

## License

This project is released under the [MIT license](LICENSE.md).
