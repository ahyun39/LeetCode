import random

class RandomizedSet:

    def __init__(self):
        self.elements = []
        self.index_map = {}

    def insert(self, val: int) -> bool:
        if val in self.index_map:
            return False
        self.elements.append(val)
        self.index_map[val] = len(self.elements) - 1
        return True

    def remove(self, val: int) -> bool:
        if val not in self.index_map:
            return False
        last_element, idx = self.elements[-1], self.index_map[val]
        self.elements[idx], self.index_map[last_element] = last_element, idx
        self.elements.pop()
        del self.index_map[val]
        return True

    def getRandom(self) -> int:
        return random.choice(self.elements)