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

## Talk ideas

Idea.

I'd like to make a talk about this approach, as it sounds refreshing.

- Start with the class with properties. Let's refactor it.
- Normal forms;
- existential processing;
- Initial class refactoring

Basically go chapter-by-chapter removing extra info.

[grug]: https://grugbrain.dev/
[tao]: https://www.mit.edu/~xela/tao.html
[dodbook]: https://www.dataorienteddesign.com/dodbook/dodmain.html
