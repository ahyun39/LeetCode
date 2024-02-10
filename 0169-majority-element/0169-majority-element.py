class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        set_nums = list(set(nums))
        for num in set_nums:
            if nums.count(num) >= (len(nums) / 2):
                answer = num
        return answer