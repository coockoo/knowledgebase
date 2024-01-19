from math import factorial, comb

nums = list("24568")
p_len = 6

# pick first number
# and
# permute all of the numbers

# todo: this thing is not generic
# as 4 numbers will generate a lot more of left side
res = int(len(nums) * factorial(p_len) / factorial(1 + p_len - len(nums)))
print(f"{p_len}-len passwords with {len(nums)} unique digits is {res}")

print(f"select 5 cards from 52 deck is {comb(52, 5)}")
