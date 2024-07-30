class Solution:
    def reverseWords(self, s: str) -> str:
        s = list(s.replace(" ", " ").strip().split())[::-1]
        return ' '.join(s)