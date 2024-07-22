class Solution:
    def isValid(self, s: str) -> bool:
        stack, pair = [], {')': '(', ']': '[', '}': '{'}
        for char in s:
            if char in pair.values():
                stack.append(char)
            elif not stack or stack.pop() != pair[char]:
                return False
        return not stack