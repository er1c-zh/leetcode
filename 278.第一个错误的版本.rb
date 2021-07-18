#
# @lc app=leetcode.cn id=278 lang=ruby
#
# [278] 第一个错误的版本
#

# @lc code=start
# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
    i, j = 1, n
    while i < j
        mid = (i + j) / 2
        bad = is_bad_version mid
        if bad
            j = mid
        else
            i = mid + 1
        end
    end
    return i
end
# @lc code=end

