class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        check = [0] * (len(ransomNote))
        for i in range(len(ransomNote)):
            if ransomNote[i] in magazine:
                check[i] = 1
                idx = magazine.index(ransomNote[i])
                magazine = magazine[:idx] + " " + magazine[idx+1:]
        if sum(check) == len(ransomNote):
            return True
        return False