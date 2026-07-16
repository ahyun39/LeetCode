class Solution:
    def fib(self, n: int) -> int:
        dp = [0] * (31)
        dp[0] = 0
        dp[1] = 1
        if n == 0 or n ==1:
            return dp[n]
            
        for i in range(2, n+1):
            dp[i] = dp[i-2] + dp[i-1]
        
        return dp[n]