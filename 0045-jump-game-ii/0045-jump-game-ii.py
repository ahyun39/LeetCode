class Solution:
    # 주어진 숫자 리스트를 순회하면서 현재 위치에서의 최대 이동 가능 거리를 계산하고, 현재 위치까지의 최대 이동 가능 거리에 도달하면 점프를 실행. 
    #이를 반복하여 최종적으로 마지막 인덱스에 도달하는데 필요한 최소 점프 횟수를 계산.
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