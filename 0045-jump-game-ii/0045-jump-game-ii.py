class Solution:
    def jump(self, nums: List[int]) -> int:
        max_reach = nums[0]
        steps = 0
        end = nums[0]
        if len(nums) > 1:
            steps = 1
        for i in range(1, len(nums)):
            if i > end:
                steps += 1
                end = max_reach
            max_reach = max(max_reach, i + nums[i])

        return steps