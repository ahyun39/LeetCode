class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        set_nums = sorted(list(set(nums)))
        answer = []
        for num in set_nums:
            if nums.count(num) > 2:
                answer += ([num]*2)
            else:
                answer += [num]*(nums.count(num))
        nums[:] = answer