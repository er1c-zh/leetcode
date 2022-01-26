#
# @lc app=leetcode.cn id=454 lang=ruby
#
# [454] 四数相加 II
#

# @lc code=start
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer[]} nums3
# @param {Integer[]} nums4
# @return {Integer}
def four_sum_count(nums1, nums2, nums3, nums4)
    m1, m2 = Hash.new{0}, Hash.new{0}
    nums1.each{
        |v1|
        nums2.each{
            |v2|
            m1[v1 + v2] += 1
        }
    }
    nums3.each{
        |v3|
        nums4.each{
            |v4|
            m2[v3 + v4] += 1
        }
    }
    result = 0
    m1.keys.each{
        |v1|
        c1 = m1[v1]
        c2 = m2[-v1]
        result += c1 * c2
    }
    return result
end
# @lc code=end

