class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        if s != "" and t != "":
            k = 0
            for i in range(len(t)):
                if k > len(s) - 1:
                    break
                if t[i] == s[k]:
                    k += 1
            if k == len(s): return True
            return False
        elif s == "" or (s == "" and t == ""):
            return True
        else:
            return False