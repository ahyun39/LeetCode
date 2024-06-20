class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        s = list(map(str,s.split()))
        if len(pattern) != len(s):
            return False
        for i in range(len(pattern)-1):
            if pattern[i] != pattern[i+1] and s[i] == s[i+1]:
                return False
            elif pattern[i] == pattern[i+1] and s[i] != s[i+1]:
                return False
            elif pattern[i] != pattern[i+1] and s[i] != s[i+1]:
                if pattern[i+1] in pattern[:i+1]:
                    idx = pattern[:i+1].index(pattern[i+1])
                    if s[idx] != s[i+1]:
                        return False
                elif s[i+1] in s[:i+1]:
                    idx = s[:i+1].index(s[i+1])
                    if pattern[idx] != pattern[i+1]:
                        return False
        return True