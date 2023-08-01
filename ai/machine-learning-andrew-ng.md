# Machine Learning

Based on the [course][mlcourse] by Andrew Ng. Started in Autumn 2018.

[CS299 Lecture Notes][lecturenotes].

[Linear Algebra Review and Reference][linalgebra].

This is the course that was shoved into my recommendations over and over again.
It feels like Andrew is my relative or something.
I'm delighted that this course if freely available on YT. Very cool.

## Lecture 01

AI is the new electricity. It will disrupt a lot of spheres. Demand is high.

Supervised learning

Given dataset (x, y), find a mapping x -> y.

Regression problem. Y is continious. Raw numbers

Classification problem. Y is a discrete number. Discrete output.

For most ML problems X is multidementional.
Unfortunately, this cannot be plotted (for visualization).

Support vector machine algorithms works with infinite dimension of vector.

Unsupervised learning – give structure to unstructured data. Get insights from data.

## Lecture 02

Supervised Learning Problem, Regression Problem

Linear regression.

Collecting dataset:

- size of house
- price

Plot data on graph.
Process of supervised learning.

Training set -> Learning algorithm -> Hypothesis ( = function)

Hypo(size) -> Price

Further notes on this lecture will be made in notebook.

## Lecture 03

Linear Regression – pick parameters theta to make a prediction.

### Locally Weighted Regression

Locally Weighted Regression – pick some local area. and make a straight line in that area.

Fit Theta to minimize different formula.

Same equation, but adding a weight, which will be 0 for far away values and 1 for closer values.
OMEGACOOL.

Weight function:

$$
\omega^{(i)} = exp(-\frac{(x^{(i)} - x)^2}{2\tau^2})
$$

Where $\tau$ – width of the window.

_Note: looks like better prediction in the area, but not full context._

When to use:

- number of features is relatively small 2-3;
- a lot of data;
- we don't want to think about what features to use;

### Classification

It's hard to draw a straight line through $y \in \{0,1\}$

Linear regression doesn't really work for that.

### Logistic regression

Want $h_{\theta}(x) \in [0,1]$.

$$
h_{\theta}(x) = g(\theta^Tx) = \frac{1}{1 + e^{-\theta^Tx}}
$$

$g(x)$ = Sigmoid = logistic function

### Gradient ascent

Super similar to linear regression. Take babysteps until land in local optimum.

$$
\theta_j := \theta_j + \alpha(y^{(i)} - h_{\theta}(x^{(i)}))x^{(i)}_j
$$

_notice the same formula for LR, but with different signs, this is OK, will be covered later_

### Newton's Method

Want to find $f(\theta) = 0$ by maximizing $l(\theta)$, which means that $l'(\theta) = 0$.

Let's find where derivative is equal to 0.

What is f is not monotonous?

Inverting matrix is compute heavy, so a lot of parameters will slow down significantly.

## Lecture 03

Generalized Linear Models

### Exponential Familty

Depending on the data, we can take different exponential family distribution.

### GLM Training

Training update rule is the same

$$
\theta_j := \theta_j + \alpha(y^{(i)} - h_{\theta}(x^{(i)}))x_j^{(i)}
$$

Learning only $\theta$

### Softmax regression

Minimize cross entropy between distributions.

## Project

Ideas:

- AI that helps finding house by given parameters.
  Describe what you want, collect data from various sources, show matching results.
  Train model on what you want.

[mlcourse]: https://www.youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU
[lecturenotes]: https://cs229.stanford.edu/main_notes.pdf
[linalgebra]: https://cs229.stanford.edu/notes2022fall/cs229-linear_algebra_review.pdf
