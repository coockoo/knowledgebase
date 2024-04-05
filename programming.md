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

## Existential processing

In the paper Out of the Tar Pit, it's concluded that the aspect of software
which causes the most complexity is state.

If we begin our attempt to eliminate control flow by looking at defensive programming,
we can try to keep our working set of data as a collections of arrays.
This way we can guarantee none of our data will be NULL.
(This is interesting, but why?)

Data processing types:

- filter – take incoming data and produce 0 or 1 element for each input element;
- mutation – produce 1 and only 1 element for each input element;
- emission – prodce 0-inf elements from input data;
- generation – produce data from no input data;

Explicit boolean can be replaced by existence of record in some table

E.g

```
# from this
table Players {
  int id
  float health
}
is_hurt = player.health < MAX_HEALTH

# to this
table Damages {
  float health
}
map<player_id, Damages> damages
is_hurt = damages.has(player.id)
```

And instead of iterating over all of the players and calculate "regeneration" to health,
only entities from the `damages` can be used.
Interesting idea. One concern only that data is spread. But that's the point, huh?

Same with enums. Enum is a derivative of the data or existence of it in table.
They can be useful sometimes: keybindings, colors, small finite sets of values,
functions that return collision responses.

Dynamic runtime polymorphism can be replaced with switching between tables.

Subscription becomes and insert, and unsubscribing a delete.
Event handling is replaced with triggers on create/update/delete.

## Component Based Objects

**Object-Oriented design**

- there is a class that has properties;
- _is-a_ relationship;

**Composition-Oriented design**

- object = bag of it's components; it does not even have to be named;
- _has-a_ relationship;

Using components means the entity type doesn't need to have the ability to do anything.
Instead, all the attributes and functionality come from the components
of which the entity is made.
Managers control updates to each component. Manager knows when/how often to update components.
So why do we need an entity? Let's just operate on array/map of components.

## Hierarchical Level of Detail

If there are a lot of objects to handle, they could be grouped into larger objects.
This is primarily related to gamedev. A lot of units can be grouped into squadron.
And once level of detail require units, squadron can break into units again.

When a high detail entity drops to a lower level of detail,
it should store a memento, a small, well-compressed nugget of data that contains
all the necessary information in order to rebuild the higher detail entity
from the lower detail one.

If you have some objects randomly generated, there is no need to memo the whole object.
The point is, once you have seeded the random number generator,
you're going to get the same results back every time you run through the same process.

The true metric of level of detail should be how much of our perception an entity is taking up.

This is a gamedev chapter. Nice to know though.

## Searching

JIT indexes is an interesting idea.

- there is a query that selects data;
- after some amount of calls, this query can spot patterns;
- using these patterns, query can "hook" itself to create/update/delete operations;
- now this query returns cache and does not do search;
- this query can do realtime stats of what searches are used the most;

Sorry, I don't remember c

```c
// assuming array is ordered, find first value that exceeds
// p = property
int i;

// slower – properties in structures laid down consequentially:  p1p2p3p4p5 p1p2p3p4p5 ...
for (i = 0; i < num; ++i) {
  if (objects[i].value >= value) {
    return objects[i]
  }
}

// faster - only values here, p1 p1 p1 p1 ...
for (i = 0; i < num; ++i) {
  if (values[i] >= value) {
    reutrn objects[i]
  }
}
```

This is faster because the cache will be filled with mostly relevant data
during the hunt phase. In the original layout,
we one or two key times per cache line.
In the updated code, we see 16 key times per cache line.
Two different data layouts for an algorithm could have more impact than the algorithm used.

If the reason for searching is to find something within a range,
then the problem isn't really one of searching, but one of sorting.

One cool trick is to store alongside big array of something, smaller array
and update them in parallel. And to search in small array. For example, top value.

## Sorting

Know your use-case and your data. There are stable sorts and unstable (usually quicker).

For top/bot N values there is a **quickselect algorithm**.
It finds n-th lowest/biggest item in unordered list and pivot will separate
values that lower and values that higher than found value.

Bubble sort can be useful. Inline implementations can be small enough for the whole
of the data and the algorithm to fit in cache (for small n).

## Optimisations and implementations

Premature optimisation is when you optimise something
without knowing whether it will make a difference.

Measure first then optimize, otherwise there is nothing to rely on when optimizing.

Aim for immediate feedback.

Give your systems a budget. Record violations and raise it as issues immediately.

- keep track of what you do;
- define problem (factual, clear);
- measure what needs to be measured;
- analyze (guess and make predictions);
- implement (fix the problem);
- confirm (create report for others to see);

Only using a very small amount of the loaded data
is one of the most common sins of the object-oriented programmer.

Column-oriented databases = structs of arrays see listing in searching.

## Maintenance and reuse

Programmers only need to be in the zone if the code is nearing deadly levels of complexity.

Whenever you assign a value to a variable, you are destroying history.
Multiple returns per function is fine.

Instead of hiding, data-oriented suggests keeping data in simple forms.

Reusability comes from being aware of the information contained within the medium it is stored.
In our case, it is normally stored as source code, but the information is not the source code.
The information is the order and existence of tasks that can and will be performed on the data.

Simple data = more existing transformations can be applied to it without "adapters".

When you're doing data-oriented development your software is entirely driven by
stateful data and stateless transforms.

## Last chapter

How many grains of sand are a pile, are a dune?

Reduced coupling and better testing.
Object-oriented design suffers from the problem of errors in communication.
Objects are not systems.

## Talk ideas

Idea.

I'd like to make a talk about this approach, as it sounds refreshing.

- Start with the class with properties. Let's refactor it.
  Can be in the area of work of the team. Pick something that is currently in use.
- Normal forms;
- existential processing;
- Initial class refactoring

Basically go chapter-by-chapter removing extra info.
Last chapeters are much closer to the gamedev and much more specific to it than I expected.

[grug]: https://grugbrain.dev/
[tao]: https://www.mit.edu/~xela/tao.html
[dodbook]: https://www.dataorienteddesign.com/dodbook/dodmain.html
