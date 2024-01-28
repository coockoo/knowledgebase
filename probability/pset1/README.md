# Problem set 1

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

[pset1]: https://web.stanford.edu/class/archive/cs/cs109/cs109.1208/psets/pset1.pdf
