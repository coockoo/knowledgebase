# Problem set 1

DISCLAIMER: I have no way of verifying if these are correct, but they feel correct.

Answers to [these problems][pset1]

## Seat 10 people

### No restrictions

This is just a basic permutation.
Each person is a unique human being, so elements are distinguishable.

$$
N = n! = 10! = 3628800
$$

### A and B must sit next to each other

- First of all, let's treat A and B as one elemen.
- Step one: permutation of 9 elements: 9!
- Step two: permutation of 2 elements in each position: 2!

$$
N = (n - 1)! \cdot 2! = 9! \cdot 2 = 725760
$$

### Adults with kids

5 adults, 5 kids. No adult/kid should sit next to adult kid.

- Step one: permutation of 5 adults 5!
- Step two: permutation of 5 kids 5!
- Step three: place kid on odd places or adult on odd places 2!

$$
N = 5! * 5! * 2! = 28800
$$

### Married couples

5 couples, each must sit together

- Step 1-5: a couple permutations $2! ^ 5$
- Step 6: Permutations of 5 couples $5!$

$$
N = 5! * 2!^5 = 3840
$$

## Zoo exhibit

### No restrictions

This sounds like simple combination and "and" rule.

- select 3 birds out of 8 = 56;
- select 3 reptiles out of 6 = 20;
- apply "and" to both results, as they are independent = 1120;

$$
N = \frac{8!}{3!\cdot(8-3)!}\cdot\frac{6!}{3!\cdot(6-3)!}
= \frac{\cancel{2\cdot3}\cdot4\cdot5\cdot\cancel{6}\cdot7\cdot8\cdot\cancel{5!}\cdot\cancel{6}}
{\cancel{3!}\cdot\cancel{5!}\cdot\cancel{3!}\cdot\cancel{3!}} =
20\cdot56 = 1120
$$

Result: 1120

### Two bird species cannot be placed together

- same amount of reptiles = 20;
- one of (sum rule):
  - select 1 non-compatible bird and select 2 of 6 birds = 2 \* 15 = 30;
  - select 3 birds out of 6 birds = 20;
- apply step rule: 20 \* 50 = 1000;

Result: 1000

### One bird and one reptile cannot be placed together

For this I would do no restrictions and remove where one bird and one reptile.

- lock one bird, select 2 out of 7 = 21;
- lock one reptile, select 2 out of 5 = 10;
- apply step rule = 210
- from first result subtract overcounting 1120 - 210 = 910

Result 910

## Programming classes

### Not in any class

[pset1]: https://web.stanford.edu/class/archive/cs/cs109/cs109.1208/psets/pset1.pdf
