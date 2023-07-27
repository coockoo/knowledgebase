# CS299 Problem Set 0

Source [here][source].

The key for understanding what is needed for solving this problem set lies
in the [linear algebra review][lareview] document.

## Gradients and Hessians

Recall that a matrix $A \in \mathbb{R}^{n \times n}$ is symmetric if $A^T = A$,
that is, $A_{ij} = A_{ji} \forall i, j$.
Also recall that gradient $\nabla f(x)$ of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$,
which is the $n$-vector of partial derivatives

**TODO: Add gradient matrix definition**

The hessian $\nabla^2f(x)$ of a function $f: \mathbb{R}^n \rightarrow \mathbb{R}$
is the $n \times n$ symmetric matrix of twice partical derivatives,

**TODO: add hessian matrix definition**

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
\frac{d}{dx}f(x) = \frac{d}{d(h(x))}g(h(x))*\frac{d}{dx}h(x)
$$

So, solution to the original question is

$$
\nabla_xf(x) = \nabla_xg(h(x)) = g'(h(x))*h'(x)
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

## (d)

**Let $f(x) = g(aTx)$ where $g : \mathbb{R} \rightarrow \mathbb{R}$
is continuously differentiable and $a \in \mathbb{R}^n$ is a vector.
What are $\nabla f(x)$ and $\nabla^2f(x)$?
(_Hint:_ your expression for $\nabla^2f(x)$ may have as few as 11 symbols,
including $'$ and parentheses.)**

$$
\nabla f(x) = \nabla g(a^Tx) = \frac{d}{da^Tx}g(a^Tx) * \frac{d}{dx}a^Tx =
\newline
= g'(a^Tx) * a
$$

$$
\nabla^2f(x) = \nabla(\nabla f(x)) = \nabla(g'(a^Tx) * a) =
\newline
= \nabla(g'(a^Tx))*a = g''(a^Tx)*a*a
$$

For some reason, there should be $a^T$ at the end, but I cannot figure out why.

[source]: https://cs229.stanford.edu/summer2020/ps0_template.pdf
[lareview]: https://cs229.stanford.edu/notes2022fall/cs229-linear_algebra_review.pdf
[chainrule]: https://ocw.mit.edu/courses/18-01-single-variable-calculus-fall-2006/b8051c7c7a28e2cd03667de9dd4865fb_lec4.pdf
