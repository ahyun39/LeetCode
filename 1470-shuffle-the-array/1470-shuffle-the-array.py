class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        a = nums[:n]
        b = nums[n:]
        ans = []
        for i in range(n):
            ans += [a[i]] + [b[i]]
        return ans