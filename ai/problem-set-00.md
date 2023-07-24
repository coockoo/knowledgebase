# CS299 Problem Set 0

Source [here][source].

## Gradients and Hessians

Recall that a matrix $A \in \mathbb{R}^{n \times n}$ is symmetric if $A^T = A$,
that is, $A_{ij} = A_{ji} \forall i, j$.
Also recall that gradient $\nabla f(x)$ of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$,
which is the $n$-vector of partial derivatives

**TODO: Add gradient matrix definition**

The hessian $\nabla^2f(x) of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$
is the $n \times n$ symmetric matrix of twice partical derivatives,

**TODO: add hessian matrix definition**

### (a)

Let $f(x) = \frac{1}{2}x^TAx+b^Tx$, where $A$ is a symmetric matrix
and $b \in \mathbb{R}^n$ is a vector. What is $\nabla f(x)$?

[source]: https://cs229.stanford.edu/summer2020/ps0_template.pdf
