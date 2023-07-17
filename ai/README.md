# AI

Let's begin the journey with some entrypoints that will be used:

- a16z [AI Cannon][aicanon];
- Stanford [AI courses][stanfordai];
- Google [Generative AI learning path][googlegenaipath];
- Some [ML Book][mlbook] that was found on the internet;

## Gentle introduction

Let's start with gentle introduction from a16z list.

### Software 2.0

An [article][soft20] from Andrej Karpathy.

Software 2.0:

- specify some goal on the behaviour of a program;
- write rough skeleton of code;
- search using computational resources for a program that works (in some restricted space);

Software is eating world. AI is eating software.

Good parts about Software 2.0:

- **Mostly only 2 operations**:
  - matrix multiplication;
  - thresholding at zero (ReLU) (TODO: what is this?);
- Easy to implement those 2 operations **close to silicon**
  (probably that's why Nvidia is booming now).
- **Constant running time**.
  Every iteration of neural forward pass takes exactly the same amount of FLOPS
  (FLoatingr-point OPerations per Second).
- **Constant memory use**. No dynamically allocated memory (could still be leaks).
- **Highly portable**, as it's just matrix multiplication.
- **Very agile**. Adding/removing data/compute/channels and retraining is enough.

Bad poarts about Software 2.0:

- **Hard to tell how**. Large networks work, but it's hard to describe how.
- **Can fail silently** by adopting some biases in the training data.
- **Difficult to analyze** for large models and some unexpected results.
- **Can be dangerous**, as we are still discovering what this stack can do.

What's missing:

- Tooling is not ideal, as for S1.0 (IDEs, debuggers, profilers etc)
- Good, massaged, clean dataset.
- Github2.0 for datasets with labels.
- Package managers.

Good article. Gentle introduction and separation. From 2017, btw.

### State of GPT

[Video][stateofgpt] from Andrej Karpathy.

There most certainly will be a lot of this guy, as he's one of the first
and most prominent pioneers in this sphere.

## Questions

- Is there a possibility to write autotests on models?
  Just to make sure that it doesn't do what we don't want it to do
  or to do what it is supposted to do?

## Thoughts

Hmm, what if AI is like a child's brain.
Children start development with categorization. In which AI is very capable of.
Creativity comes after. Highly creative stuff comes from intersection of experiences.
Now Generative AI is in the state of "I do good things that was already done".
What if models were trained across industries and data and selection so they would try to combine.

[aicanon]: https://a16z.com/2023/05/25/ai-canon/
[stanfordai]: https://ai.stanford.edu/courses/
[googlegenaipath]: https://www.cloudskillsboost.google/paths/118
[soft20]: https://karpathy.medium.com/software-2-0-a64152b37c35
[mlbook]: https://smlbook.org/book/sml-book-draft-latest.pdf
[stateofgpt]: https://build.microsoft.com/en-US/sessions/db3f4859-cd30-4445-a0cd-553c3304f8e2
