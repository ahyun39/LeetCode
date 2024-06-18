import re
class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = re.sub(r'[-=+,#/\?:;^.@*\"※~ㆍ!』_‘|\(\)\[\]{\}`\'…》\”\“\’·]', '', s.lower())
        s = ''.join(s.split())
        for i in range(len(s)//2):
            if s[i] != s[len(s)-i-1]:
                return False
        return True