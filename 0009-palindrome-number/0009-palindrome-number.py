class Solution:
    def isPalindrome(self, x: int) -> bool:
        x = str(x)
        verse_x = x[::-1]
        if x == verse_x:
            return True
        else:
            return False