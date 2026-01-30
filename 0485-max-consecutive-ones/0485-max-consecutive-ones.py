class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        ans = 0
        now_sum = 0
        for num in nums:
            if num == 1:
                now_sum += 1
            else:
                ans = max(ans, now_sum)
                now_sum = 0
        return max(ans, now_sum)