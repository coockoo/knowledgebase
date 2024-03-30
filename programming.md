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

## Nice to read articles

- [The Grug Brained Developer][grug] from creator of HTMX;

  Great article about complexity in software development.
  Narrated in the funny manner from the Grug, who is convinced that "complexity very, very bad".

- [The Tao of Programming][tao] translated by Geoffrey James;

  Collection of stories, collected in the spiritual format about programming.
  Not much educational, but rather entertaining and thought provoking.

## Data-Oriented Design

Based on the Data-Oriented Design [book][dodbook] by Richard Fabian

### Overview

Currently it feels like reading "oop is bad and data is great" over and over again.

### It's all about the data.

All the applications that have ever been written,
have been written to output data based on some input data.

Data is nothing without it's meaning. What is 4 vs what is 4 bananas?

When you see lists and trees, arrays and maps, tables and rows,
you can reason about them and their interactions and transformations.
If you attempt to do the same with homes and offices, roads and commuters,
coffee shops and parks, you can often get stuck in thinking about the problem domain concepts.

Instead of planning to be extendable, it plans to be simple and replaceable, and get the job done.
Extendable can be added later.

### Relational databases

**First normal form** can be described as making sure the tables are not sparse.

- every cell contains one and only one atomic value (no arrays, no nulls);
- every row distinct (existence of primary key PK);

Moving the repeats and all the optional content to other tables.
If we store data like this, then we know everything is not NULL.

_note_ This is interesting, as during SELECT complex query will be needed where will be `null`s,
or multiple queries, which is not good due to I/O bottlenecks.
`UPDATE`s look easier, as there won't be `null`s. Also write becomes faster. Theoretically.

**Second normal form** is about trying to pull out columns that don't depend on
only a part of the PK.

- 1NF
- remove columns that depend only on part of the PK;

**Third normal form** is about all the attributes (e.g. database columns)
are functionally dependent on solely a key.

- 2NF
- remove transitive dependencies;

**Boyce-Codd normal form** is a bit stricter version of 3NF

- 3NF
- remove functional dependencies;

**Domain knowledge normal form** adjusts data structure to your domain.
It allows removing some unnecessarily stored data.

All of this normalizations is about splitting data and trying to replace
arrays/nulls/duplication with relations.
It's up to you to decide how far to go when normalizing, as it adds complexity too.

[grug]: https://grugbrain.dev/
[tao]: https://www.mit.edu/~xela/tao.html
[dodbook]: https://www.dataorienteddesign.com/dodbook/dodmain.html
