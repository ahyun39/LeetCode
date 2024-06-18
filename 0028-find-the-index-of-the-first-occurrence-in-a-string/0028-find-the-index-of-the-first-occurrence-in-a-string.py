class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        ans = -1
        for i in range(len(haystack)-len(needle)+1):
            if haystack[i:i+len(needle)] == needle:
                ans = i
                break
        return ans