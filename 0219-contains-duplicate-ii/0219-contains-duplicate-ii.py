class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        i = 0
        while i < len(nums):
            if nums[i] in nums[i+1:min(i+k+1,len(nums))]:
                return True
            i += 1
        return False