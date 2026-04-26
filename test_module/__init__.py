import re


def mask_numbers(s: str) -> str:
    return re.sub(r"\d", "*", s)
