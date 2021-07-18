#
# @lc app=leetcode.cn id=275 lang=ruby
#
# [275] H 指数 II
#

# @lc code=start
# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
    i, j = 0, citations.length
    while j - i > 1
        mid = (i + j) / 2
        val = citations[mid]
        cnt = citations.length - mid
        if cnt >= val
            i = mid
        else
            j = mid
        end
    end
    r = [citations[i], citations.length - i].min
    if i + 1 < citations.length
        r = [r, [citations[i + 1], citations.length - i - 1].min].max
    end
    return r
end
# @lc code=end

if __FILE__ == $0
    p h_index [0,0,1,1]
end
