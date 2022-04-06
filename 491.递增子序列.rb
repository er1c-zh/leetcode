#
# @lc app=leetcode.cn id=491 lang=ruby
#
# [491] 递增子序列
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
    mask = Hash.new(){}
    queue = Array.new(300){[]}
    nums.each{
        |v|
        nq = Array.new(300){[]}
        t = v + 100
        cur_arr = []
        (0..t).each{
            |i|
            queue[i].each{
                |pre|
                tmp = pre.clone
                tmp.append(v)
                if mask[tmp] != nil
                    next
                end
                mask[tmp] = true
                cur_arr.append tmp
            }
        }
        cur_arr.each{
            |_v|
            queue[t].append _v
        }
        queue[t].append [v]
    }
    result = []
    queue.each{
        |v|
        v.each{
            |item|
            if item.length <= 1
                next
            end
            result.append item
        }
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{find_subsequences [4,6,7,7]}"
end
