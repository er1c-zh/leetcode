#
# @lc app=leetcode.cn id=274 lang=ruby
#
# [274] H 指数
#

# @lc code=start
# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
    citations.sort!{
        |x, y|
        y <=> x
    }

    # p citations

    result = 0
    citations.each_index{
        |idx|
        cnt = idx + 1
        val = citations[idx]
        result = [result, [cnt, val].min].max
    }
    return result
end
# @lc code=end

if __FILE_ = $0
    p h_index([3,0,6,1,5])
    p h_index([10, 12])
    p h_index([10])
    p h_index([1,10,10,10])
    p h_index([0])
    p h_index([1,1,1,1,3])
    p h_index([1,1,3])
end
