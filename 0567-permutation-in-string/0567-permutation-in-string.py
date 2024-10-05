class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        s1 = sorted(list(s1))
        l = len(s1)
        for i in range(0, len(s2)-l+1):
            compare_string = sorted(list(s2[i:i+l]))
            if s1 == compare_string:
                return True
        return False