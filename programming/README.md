# Programming

## Values of a good programmer

This is an evolving opinionated list of nice to have things.

- product first;
  - selecting not ideal tool for building the product is fine;
  - don't let the process prevail over product;
  - talk to users;
- deliver fast;
  - some things, like user data privacy or security are exceptions;
  - raw unfinished working product is better than state-of-the-art one in the archive;
- iterate fast till perfection;
  - environment, metrics, team communication should be optimized;
- straight and direct feedback;
  - does not assume being rude; don't be an asshole;
  - even joke-like toxicity can be a small crack towards canyon;

## Maintenance

With each new line of code there is added maintenance burden for the years to come.

Try to keep [complexity demon][grugcomp] at bay. By introducing new feature, new behaviour,
it adds some amount of complexity to the system (codebase, product, mental understanding).
And moreover, this complexity starts to interact with other complexities that were shipped earlier.
And it can accelerate by the growth of factorial, as N + 1 feature needs to be in harmony with N features,
N + 2 with N + 1 and so on.

By making concious decision to remove something once in a while, developer make sure that the next new thing gets more attention.
It allows focusing more on building a thing, and not “how this thing will interact with other things”.
Everyone understands how things work, as there is only a number of things to keep track of.

## Books

- [Data-Oriented Design](./data-oriented-design.md)
- [Structure and Interpretation of Computer Programs](./sicp.md)

## Functional Programming

Has it's own [section](./functional.md)

## Hindley-Milner Type System

Nice explanation about type inferrence of [Hindley-Milner][hm].
It has a tractable algorithm for determining types from untyped syntax
- it supports polymorphic functions;
- there is a "best" principal type (if there is one or more types of function or value);
- **the principal type can be inferred without requiring any type declarations**;

For example: if `a: int` and `b: int` then `a + b` is also `int` without need of doing type declaration.

"Damas-Hindley-Milner inference two ways" [article][type-inf] about type inferrence.
It delves (haha, imagine using this word unironically) into this topic:
- impelemtation of Algorithm W and Algorithm J for type inferrence;
```haskell
infer_w :: Expr -> Context -> [Subst, MonoType]
```
- let polymorphism (type variables are implicitly quantified at let bindings);
- Algorithm M (w + third parameter to the inference function, which is the monotype that you expect the expression to have);
- etc (like inferrence of more complex data types);

## Nice to read articles

- [The Grug Brained Developer][grug] from creator of HTMX;

  Great article about complexity in software development.
  Narrated in the funny manner from the Grug, who is convinced that "complexity very, very bad".

- [The Tao of Programming][tao] translated by Geoffrey James;

  Collection of stories, collected in the spiritual format about programming.
  Not much educational, but rather entertaining and thought provoking.

## The Power of 10

NASA's [Rules for Developing Safety-Critical Code][poweroften].

## Tiger Style

[Tiger Style][tigerstyle] from the creators of the TigerBeetle database.

> “Simplicity and elegance are unpopular because they require hard work and discipline to achieve” — Edsger Dijkstra

> “the simple and elegant systems tend to be easier and faster to design and get right, more efficient in execution, and much more reliable” — Edsger Dijkstra

Zero technical debt policy. Do it right the first time.
Design/Implementation problem solution is cheaper than production problem.

- use simple, explicit control flow for clarity;
- put limit on everything (in reality everything has a limit);
- the only way to handle corrupt code is to crash it;
- assert arguments and return values (love this one);
- assert positive (expected) AND negative (not expected) spaces;
- all memory must be statically allocated at startup (wow);

And other stuff.

## Web

Has it's own [section](./web.md).

## OS

### POSIX

**POSIX** (Portable Operating System Interface) is an API for operating systems. Standardized.
The main purpose of POSIX is to allow developers to write programs that can run
on any POSIX-compliant operating system.

## To Read

- [Notes on Structured Programming][notesonsp] by Edsger W. Dijkstra
- [An Introduction to Assembly Programming with RISC-V][riskv] Introduction to assembly programming
- [Computer Systems A Programmer’s Perspective][compsys] about low-level C programming

[grug]: https://grugbrain.dev/
[grugcomp]: https://grugbrain.dev/#grug-on-complexity
[tao]: https://www.mit.edu/~xela/tao.html
[notesonsp]: https://www.cs.utexas.edu/users/EWD/ewd02xx/EWD249.PDF
[riskv]: https://riscv-programming.org/book/riscv-book.html
[compsys]: https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/books/CSAPP_2016.pdf
[type-inf]: https://bernsteinbear.com/blog/type-inference/
[hm]: https://stackoverflow.com/questions/399312/what-is-hindley-milner/399392
[tigerstyle]: https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md
[poweroften]: https://web.eecs.umich.edu/~imarkov/10rules.pdf
