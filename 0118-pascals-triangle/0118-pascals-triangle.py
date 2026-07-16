class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        ans = []
        for i in range(1, numRows+1):
            if i == 1:
                ans.append([1])
            elif i == 2:
                ans.append([1, 1])
            else:
                l = []
                for j in range(i):
                    if j == 0:
                        l.append(1)
                    elif j == i-1:
                        l.append(1)
                    else:
                        l.append(ans[i-2][j-1] + ans[i-2][j])
                ans.append(l)
        return ans