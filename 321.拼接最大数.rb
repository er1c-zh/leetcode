#
# @lc app=leetcode.cn id=321 lang=ruby
#
# [321] 拼接最大数
#

# @lc code=start
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
    debug = false
    li, lj = nums1.length, nums2.length
    dp = Array.new(li + 1){
        Array.new(lj + 1){
            Array.new(k + 1)
        }
    }

    (0..li).each{
        |i|
        (0..lj).each{
            |j|
            dp[i][j][0] = []
        }
    }

    (1..k).each{
        |l|
        (0..li).each{
            |di|
            (0..lj).each{
                |dj|
                i, j = li - di, lj - dj
                vals = []
                if di + dj < l
                    next
                end

                if i < li && dp[i + 1][j][l - 1] != nil
                    vals.append [nums1[i]] + dp[i + 1][j][l - 1]
                end
                if j < lj && dp[i][j + 1][l - 1] != nil
                    vals.append [nums2[j]] + dp[i][j + 1][l - 1]
                end
                if i < li
                    v = dp[i + 1][j][l]
                    if v != nil
                        vals.append v
                    end
                end
                if j < lj
                    v = dp[i][j + 1][l]
                    if v != nil
                        vals.append v
                    end
                end
                if debug
                    puts "(#{i}, #{j}) #{l} => #{vals}"
                end
                (0..l - 1).each{
                    |idx|
                    if vals.length <= 1
                        break
                    end
                    nv = []
                    cur = nil
                    vals.each{
                        |v|
                        if cur == nil
                            cur = v[idx]
                            nv.append v
                        else
                            if cur < v[idx]
                                cur = v[idx]
                                nv = [v]
                            elsif cur == v[idx]
                                nv.append v
                            end
                        end
                    }
                    vals = nv
                }
                if vals.length > 0
                    dp[i][j][l] = vals[0]
                end
            }
        }
    }

    return dp[0][0][k]
end
# @lc code=end

if __FILE__ == $0
    p max_number([3, 4, 6, 5], [9, 1, 2, 5, 8, 3], 5)
    p max_number([6,7], [6,0,4], 5)
    p max_number([3,9], [8,9], 3)
    p max_number([8,0,4,4,1,7,3,6,5,9,3,6,6,0,2,5,1,7,7,7,8,7,1,4,4,5,4,8,7,6,2,2,9,4,7,5,6,2,2,8,4,6,0,4,7,8,9,1,7,0],[6,9,8,1,1,5,7,3,1,3,3,4,9,2,8,0,6,9,3,3,7,8,3,4,2,4,7,4,5,7,7,2,5,6,3,6,7,0,3,5,3,2,8,1,6,6,1,0,8,4], 50)
    #p max_number()
end
