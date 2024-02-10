from collections import deque
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        rotate_list = deque(nums)
        rotate_list.rotate(k)
        nums[:] = list(rotate_list)
        