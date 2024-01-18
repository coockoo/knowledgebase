# Probability

Learning based on the [CS109][cs109] course.

Videos are [here][videos].

## Introduction

Lector is so hyped, which is nice. I think this course will be fine.

Protein folding. Take amino acid and 3d render it.

Neuron:

- inputs (weighted);
- computing in nucleus; squashing;
- output as a probability;

Intelligence comes from the weights. Perfect weights = intelligence.

## Counting

Counting: How many possible outcomes satisfy some event?

- Dice 6 outcomes {1,2,3,4,5,6}
- Dice even only 3 outcomes {2,4,6}
- 2 Dice 36 outcomes

### Step rule

AND

Sets of events A and B.

If they are independent. Number of outcomes equals to $|A| \cdot |B|$.

If we want to generate all of the images of 12 pixels = 256 ^ 3 ^ 12 distinct images.

10 ^ 80 atoms in the known universe.

Big chunk of computer science and programming is to avoid this counting rule.

### Sum rule

OR

Outcomes either A or B.

There is no element in set A and in set B. Mutualy exclusive $A \cap B = \varnothing$.

A bit more generic (Inclusion/Exclusion)

$$
N = |A| + |B| - |A \cap B|
$$

### Mix and match both: steps and sum

#### 6 bits communication

Problem:

- 6 bit string;
- should start with 01 or end with 10;

Solution (naiive):

- Start with 01: 2 ^ 4
- End with 10: 2\*2 (middle ones) \* 3 (first ones without "01")
- 16 + 12 = 28

Interesting thing, selecting "01" first is also a step. Selecting "10" is also a step.

#### ABCD

Problem:

- how many unique was are there to order the letters?

Solution:

- choose first letter (4 choices)
- choose second letter (3 choices)
- choose third letter (2 choices)
- choose fourth letter (1 choices)
- $|A|!$

#### BOBA

Problem:

- how many unique ways are there to order the letters?

Solution:

This can be solved in the straightforward way.
Recursively go through all of the letters, add them to the word, add word to set if it's length
is equal to input word length. Result is the size of the set.

Result: 12

#### MISSISSIPPI

This reminds me AOC task part 2. You can solve "BOBA" straight ahead using `set`,
but for second part formula is needed.

I think I saw the pattern and comparison to the "raw" version gives

$$
N = \frac{len(word)!}{\prod_{letter}{count(letter)!}}
$$

But this is a naiive approach, not backed by the knowledge of theory,
just solving, looking at the numbers and spotting some patterns.

Result: 34650

### Permutations

Permutation is **ordered** arrangement of objects.

If elements of the permutation are **distinct** – number of permutations is $n!$.

If not – this is a way to look at it:

Permutation of distinct objects =
permutations of some objects are indistinct X permutations of indistinct objects.

Given $n_i$ – group of indistinguishable elements within $n$.

$$
N = \frac{n!}{\prod_{i}{n_i!}}
$$

[cs109]: https://web.stanford.edu/class/archive/cs/cs109/cs109.1234/
[videos]: https://www.youtube.com/watch?v=2MuDZIAzBMY&list=PLoROMvodv4rOpr_A7B9SriE_iZmkanvUg
