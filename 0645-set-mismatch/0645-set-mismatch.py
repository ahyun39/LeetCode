class Solution:
    from collections import Counter
    def findErrorNums(self, nums: List[int]) -> List[int]:
        num_dict = Counter(nums)
        a, b = 0, 0
        for i in range(1, len(nums)+1):
            if num_dict[i] == 2:
                a = i
            if i not in num_dict:
                b = i
        return [a, b]