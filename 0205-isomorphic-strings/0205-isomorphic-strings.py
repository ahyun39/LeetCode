class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        for i in range(len(s)-1):
            if s[i] != s[i+1] and t[i] == t[i+1]:
                return False
            elif s[i] == s[i+1] and t[i] != t[i+1]:
                return False
            elif s[i] != s[i+1] and t[i] != t[i+1]:
                if s[i+1] in s[:i+1]:
                    idx = s[:i+1].index(s[i+1])
                    if t[idx] != t[i+1]:
                        return False
                elif t[i+1] in t[:i+1]:
                    idx = t[:i+1].index(t[i+1])
                    if s[idx] != s[i+1]:
                        return False
        return True