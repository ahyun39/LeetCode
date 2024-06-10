class Solution:
    def romanToInt(self, s: str) -> int:
        roman = {"I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000}
        ans = 0
        if len(s) == 1:
            return roman[s[0]]
        else:
            i = 0
            while i < len(s)-1:
                if roman[s[i]] >= roman[s[i+1]]:
                    ans += roman[s[i]]
                    i += 1
                else:
                    ans += (roman[s[i+1]]-roman[s[i]])
                    i += 2
            if roman[s[-2]] >= roman[s[-1]]:
                ans += roman[s[-1]]
            return ans