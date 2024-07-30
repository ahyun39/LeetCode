class Solution:
    def reverseWords(self, s: str) -> str:
        s = s.replace(" ", " ").strip()
        s = list(s.split())[::-1]
        return ' '.join(s)