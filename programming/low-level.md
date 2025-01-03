# Low Level

## Memory Padding

- `int` (4 bytes) needs to start at positions divisible by 4;
- `short` (2 bytes) at positions divisible by 2;
- `char` (1 byte) can start anywhere;

Bad:

```c
struct ExampleBad {
    char a;   // Starts at position 0
    int b;    // Needs position 4, so padding added at 1,2,3
}
// Memory layout:
// Position: 0  1  2  3  4  5  6  7
// Content:  a  P  P  P  b  b  b  b
// (P = padding byte)
```

Good:

```c
struct ExampleGood {
    int b;    // Starts at position 0
    char a;   // Needs position mod(1), so can be placed at 4
}
// Memory layout:
// Position: 0  1  2  3  4
// Content:  b  b  b  b  a
```
