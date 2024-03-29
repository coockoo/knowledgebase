# CS299 Problem Set 0

Source [here][source].

The key for understanding what is needed for solving this problem set lies
in the [linear algebra review][lareview] document
and in the [probability theory review and reference][probreview] document.

This might be called as cheating, but sometimes when I got stuck,
I used [this][key1] and [this][key2] as reference, while trying to understand why.
Also, since I'm not a student of the class and have no community to talk to,
it helped me do some verification of my work.

## Gradients and Hessians

Recall that a matrix $A \in \mathbb{R}^{n \times n}$ is symmetric if $A^T = A$,
that is, $A_{ij} = A_{ji} \forall i, j$.
Also recall that gradient $\nabla f(x)$ of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$,
which is the $n$-vector of partial derivatives

**TODO: Add gradient matrix definition**

The hessian $\nabla^2f(x)$ of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$
is the $n \times n$ symmetric matrix of twice partical derivatives,

$$
\nabla^2_xf(x) \in \mathbb{R}^{n \times n} =
\begin{bmatrix}
\frac{\partial^2f(x)}{\partial x^2_1} & \frac{\partial^2f(x)}{\partial x_1 \partial x_2} & \dots & \frac{\partial^2f(x)}{\partial x_1 \partial x_n} \\
\frac{\partial^2f(x)}{\partial x_2 \partial x_1} & \frac{\partial^2f(x)}{\partial x^2_2} & \dots & \frac{\partial^2f(x)}{\partial x_1 \partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial^2f(x)}{\partial x_n \partial x_1} & \frac{\partial^2f(x)}{\partial x_n \partial x_2} & \dots & \frac{\partial^2f(x)}{\partial x^2_n}
\end{bmatrix}
$$

### (a)

**Let $f(x) = \frac{1}{2}x^TAx+b^Tx$, where $A$ is a symmetric matrix
and $b \in \mathbb{R}^n$ is a vector. What is $\nabla f(x)$?**

First of all (page 24 of review), it follows directly from the equivalent properties of partial derivatives that:

$$
\nabla_x(f(x) + g(x)) = \nabla_xf(x)+\nabla_xg(x)
$$

Gradient of sum of functions is equal to sum of gradients of functions.

Secondly (page 24), constant real value can be extracted outside of the gradient

$$
t \in \mathbb{R}, \nabla_x(tf(x)) = t \nabla_x f(x)
$$

Lastly, some of the Gradients and Hessians were already calculated in 4.3 (page 27),

$$
\nabla_x b^Tx = b
\newline
\nabla_xx^TAx = 2Ax \text{, if A symmetric}
\newline
\nabla_x^2x^TAx = 2A \text{, if A symmetric}
$$

So, gradient for the initial function $f(x)$

$$
\nabla_x f(x)
= \nabla_x(\frac{1}{2}x^TAx+b^Tx)
= \nabla_x(\frac{1}{2}x^TAx) + \nabla_x(b^Tx) =
\newline
= \frac{1}{2}\nabla_x(x^TAx) + \nabla_x(b^Tx)
= \frac{1}{2}2Ax + b
= Ax + b
$$

### (b)

**Let $f(x)=g(h(x))$, where $g: \mathbb{R} \rightarrow \mathbb{R}$
is differentiable and $h: \mathbb{R}^n \rightarrow \mathbb{R}$
is differentiable. What is $\nabla f(x)$?**

For solving this problem a [chain rule][chainrule] should be recalled.

$$
\frac{d}{dx}f(x) = \frac{d}{d(h(x))}g(h(x))\frac{d}{dx}h(x)
$$

So, solution to the original question is

$$
\nabla_xf(x) = \nabla_xg(h(x)) = g'(h(x))h'(x)
$$

### \(c\)

**Let $f(x) = \frac{1}{2}x^TAx+b^Tx$, where $A$ is a symmetric matrix
and $b \in \mathbb{R}^n$ is a vector. What is $\nabla^2 f(x)$?**

Remembering all of the properties described in the task (a),

$$
\nabla^2_x f(x)
= \nabla^2_x(\frac{1}{2}x^TAx+b^Tx)
= \nabla^2_x(\frac{1}{2}x^TAx) + \nabla^2_x(b^Tx) =
\newline
= \frac{1}{2}\nabla^2_x(x^TAx) + \nabla^2_x(b^Tx)
= \frac{1}{2}2A + 0
= A
$$

### (d)

**Let $f(x) = g(a^Tx)$ where $g : \mathbb{R} \rightarrow \mathbb{R}$
is continuously differentiable and $a \in \mathbb{R}^n$ is a vector.
What are $\nabla f(x)$ and $\nabla^2f(x)$?
(_Hint:_ your expression for $\nabla^2f(x)$ may have as few as 11 symbols,
including $'$ and parentheses.)**

$$
\nabla f(x) = \nabla g(a^Tx) = \frac{d}{da^Tx}g(a^Tx) \frac{d}{dx}a^Tx = g'(a^Tx)a
$$

Hint to taking Hessian lays on the page 24 and 25 of [review][lareview]
and definition of the Hessian itself.

$$
(\nabla^2_xf(x))_{ij}= \frac{\partial^2{f(x)}}{\partial x_i \partial x_j}
$$

If we are being sloppy, it can be written as

$$
\nabla^2_xf(x) = \nabla_x(\nabla_xf(x))^T
$$

So long as we understand that this really means taking the gradient of each entry of
$\nabla_x(\nabla_xf(x))^T$, not the gradient of the whole vector.

TODO: Try to explain to someone how to get this solution,
as currently it's a bit hard for me to explain.

$$
\nabla^2 f(x) = g''(a^Tx) a (\frac{d}{dx}a^Tx)^T = g''(a^Tx)aa^T
$$

As $f(x) \in \mathbb{R}$, so $g''(x) \in \mathbb{R}$, so this can be seen as common
real value that can be moved outside of the matrix.

## Positive definite matrices

Given matrix $A \in \mathbb{R}^{n \times n}$

It is _positive semi-definite_ (PSD), denoted $A \succeq 0$, if

- $A = A^T$ (symmetric)
- $x^TAx \geq 0 \; \forall x \in \mathbb{R}^n$.

It is _positive definite_, denoted $A \succ 0$, if

- $A = A^T$ (symmetric)
- $x^TAx \gt 0 \; \forall x \neq 0$, all non-zero vectors $x$.

The simplest example of a PSD is the identity $I$.

_Note_: it's good to understand that $x^TAx \in \mathbb{R}^1$

### (a)

Let $z \in \mathbb{R}^n$ be an n-vector. Show that $A = zz^T$ is positive semidefinite.

First, let's prove that $A$ is symmetric:

$A_{ij} = z_iz_j$, $A_{ji} = z_jz_i = z_iz_j = A_{ij} \; \forall i,j$

Also, by transpose properties:

- $(A^T)^T = A$
- $(AB)^T = B^TA^T$

$(zz^T)^T = (z^T)^Tz^T = zz^T$

Second part, using the associativity property of the matrix multiplication
and the same transpose property:

$(AB)C = A(BC)$

Since $x^Tz \in \mathbb{R}^1$ and this means that $x^Tz = (x^Tz)^T$

$x^TAx = x^Tzz^Tx = x^Tz(x^Tz)^T = (x^Tz)^2 \geq 0$

Which proves that $A = zz^T$ is positive semidefinite.

### (b)

**Let $z \in \mathbb{R}^n$ be a _non-zero n_-vector. Let $A = zz^T$.
What is the null-space of $A$? What is the rank of $A$?**

What is **nullspace** is defined on the page 13 of [review][lareview].

$$
\mathcal{N}(A) = \{ x \in \mathbb{R}^n : Ax=0 \}
$$

$\mathcal{N}(A) = \{ zz^Tx = 0\}$. Since $z$ is a _non-zero n_-vector,
so it can be removed from the equation and nullspace is $z^Tx=0$.

TODO: calculate rank. I have no idea how to do this and why it's not simply $n$.

### \(c\)

**Let $A \in \mathbb{R}^{n \times n}$ be positive semidefinite
and $B \in \mathbb{R}^{m \times n}$ be arbitraray, where $m, n \in \mathbb{R}$.
Is $BAB^T$ PSD? If so, prove it. If not, give a counterexample with explicit $A, B$.**

Let's show that matrix is symmetric. Same properties will be used, as in (a).
Plus $A = A^T$, as $A$ is PSD.

$(BAB^T)^T = (B^T)^T(BA)^T = BA^TB^T = BAB^T$

Secondly, we'll show that for any arbitrary vector $x$ value is greater or equal to 0.

$x^TBAB^Tx = (B^Tx)^TA(B^Tx)$

If $B$ is arbitrary matrix and $x$ is an arbitrary vector,
so $x'=B^Tx \in \mathbb{R}^n$ is an arbitrary vector.

And since $A$ is PSD, then for any arbitrary $x'$: $x'^TAx' \geq 0$, which proves that
$BAB^T$ is PSD.

_Note_: This means that for any given PSD matrix $A$,
we can multiply it $BAB^T$ by any arbitrary matrix of different size and still get a PSD matrix.

## Eigenvectors, eigenvalues, and the spectral theorem

TODO

## Probability and multivariate Gaussians

Suppose $X = (X_1, ..X_n)$ is sampled from a multivariate Gaussian distribution
with mean $\mu$ in $\mathbb{R}^n$ and covariance $\Sigma$ in $S^n_+$
(i.e. $\Sigma$ is positive semidefinite).
This is commonly also written as $X \sim \cal{N}(\mu, \Sigma)$.

### (a)

Describe the random variable $Y = X_1 + X_2 + ... + X_n$.
What is the mean and variance?
Is this a well known distribution, and if so, which?

[source]: https://cs229.stanford.edu/summer2020/ps0_template.pdf
[lareview]: https://cs229.stanford.edu/notes2022fall/cs229-linear_algebra_review.pdf
[chainrule]: https://ocw.mit.edu/courses/18-01-single-variable-calculus-fall-2006/b8051c7c7a28e2cd03667de9dd4865fb_lec4.pdf
[probreview]: https://cs229.stanford.edu/notes2022fall/cs229-probability_review.pdf
[key1]: https://james-chuang.github.io/notes/cs229/ps0_2016.pdf
[key2]: https://github.com/waynemystir/stanford-cs229/blob/master/prob-set-0/ps0_key.pdf
