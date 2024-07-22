class Solution:
    def isValid(self, s: str) -> bool:
        l = []
        for i in range(len(s)):
            if s[i] in ["(","[","{"]:
                l.append(s[i])
            else:
                if s[i] == ")":
                    if l:
                        if l.pop() != "(":
                            return False
                    else:
                        return False
                elif s[i] == "]":
                    if l:
                        if l.pop() != "[":
                            return False
                    else:
                        return False
                else:
                    if l:
                        if l.pop() != "{":
                            return False
                    else:
                        return False
                
        if l:
            return False
        return True