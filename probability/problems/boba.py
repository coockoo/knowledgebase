from math import factorial
from sys import argv
from itertools import permutations


mode = argv[1] if len(argv) > 1 else "fast"


def solve(letters: str):
    counts = {}
    for letter in letters:
        counts[letter] = (counts.get(letter) or 0) + 1

    res = factorial(len(letters))

    for value in counts.values():
        res /= factorial(value)

    return int(res)


def solve_raw(letters: list, current: str = "", res: set = None):
    if not len(letters):
        if not res:
            res = set()
        res.add(current)
        return res

    for idx, letter in enumerate(letters):
        next = letters.copy()
        next.pop(idx)
        res = solve_raw(next, current + letter, res)

    return res


words = ["ABCD", "BOBA", "MISSISSIPPI", "10100"]
for word in words:
    res = ""
    if mode == "slow":
        res = len(solve_raw(list(word)))
    elif mode == "lib":
        res = len(set(permutations(list(word))))
    else:
        res = solve(word)
    print(word, res)
