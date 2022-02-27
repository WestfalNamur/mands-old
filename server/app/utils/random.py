"""Random data generation functions.

https://www.askpython.com/python/examples/generate-random-strings-in-python
"""


import random


def create_random_string(n: int) -> str:
    random_string = ""
    for _ in range(n):
        # Considering only upper and lowercase letters
        random_integer = random.randint(97, 97 + 26 - 1)
        flip_bit = random.randint(0, 1)
        # Convert to lowercase if the flip bit is on
        random_integer = random_integer - 32 if flip_bit == 1 else random_integer
        # Keep appending random characters using chr(x)
        random_string += chr(random_integer)
    return random_string
