class Solution:
    from collections import Counter
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        cnt = Counter(nums)
        ans = []
        for num in nums:
            smaller_num = 0
            for c in cnt:
                if c != num and c < num:
                    smaller_num += cnt[c]
            ans.append(smaller_num)
        return ans