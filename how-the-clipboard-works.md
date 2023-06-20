# How the clipboard works

Based on the [article][article].

## Key findings

- What is usually called "clipboard" technically is called "selection";

### Copy

- Application, on which <kbd>Cmd</kbd> + <kbd>C</kbd> happens "announces":
  _"I have the clipboard now, and have data of type(s) [mimetype][mimetype]"_.
  No actual copying is done at this point, only setting selection.

### Paste

- Application, on which <kbd>Cmd</kbd> + <kbd>V</kbd> happens, take only the types
  that it can handle.
- On "copy application" write file descriptor is created.
- On "paste application" read file descriptor is created.
- Data is "piped" from one application to another.

### Questions

- Is there a tool, where I can see the current types and selection to understand what happens?
- Try to play with paste in the code and see what is actually pasted.

[article]: https://whynothugo.nl/journal/2022/10/21/how-the-clipboard-works/
[mimetype]: https://en.wikipedia.org/wiki/Media_type
