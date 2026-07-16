class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        dp = []

        for i in range(numRows):
            # 현재 행을 모두 1로 초기화
            row = [1] * (i + 1)

            # 양 끝을 제외한 내부 값 계산
            for j in range(1, i):
                row[j] = dp[i - 1][j - 1] + dp[i - 1][j]

            dp.append(row)

        return dp