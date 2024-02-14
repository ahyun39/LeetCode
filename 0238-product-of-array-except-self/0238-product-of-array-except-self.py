class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left_product, right_product = [1] * n, [1] * n
        ans = [1] * n

        # 왼쪽 곱 계산
        left = 1
        for i in range(1, n):
            left *= nums[i - 1]
            left_product[i] = left

        # 오른쪽 곱 계산
        right = 1
        for i in range(n - 2, -1, -1):
            right *= nums[i + 1]
            right_product[i] = right

        # 최종 결과 계산
        for i in range(n):
            ans[i] = left_product[i] * right_product[i]

        return ans