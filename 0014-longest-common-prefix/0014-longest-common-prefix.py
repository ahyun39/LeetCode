class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        strs.sort(key=lambda x:len(x))
        represent = strs[0]
        max_str = ""
        for i in range(len(represent),0,-1):
            cnt = 0
            for s in strs:
                if represent[0:i] in s[0:i]:
                    cnt += 1
            if len(strs) == cnt:
                max_str = represent[0:i]
                break
        return max_str