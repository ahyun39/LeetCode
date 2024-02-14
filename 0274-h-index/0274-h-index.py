class Solution:
    def hIndex(self, citations: List[int]) -> int:
        citations.sort(reverse=True)
        ans = 0
        for i in range(len(citations)):
            if i+1 > citations[i]:
                ans = i
                break
            elif i+1 <= citations[i] and i == len(citations)-1:
                ans = i+1
        return ans