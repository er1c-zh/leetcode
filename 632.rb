#
# @lc app=leetcode.cn id=632 lang=ruby
#
# [632] 最小区间
#

# @lc code=start
# @param {Integer[][]} nums
# @return {Integer[]}
def smallest_range(nums)
    h = Hash.new{[]} # h[i] = [j] 数字i对应序列id
    for i in 0...nums.size
        for j in 0...nums[i].size
            if j > 0 && nums[i][j] == nums[i][j - 1]
                next
            end
            h[nums[i][j]] = h[nums[i][j]].append i
        end
    end

    list = []
    for n in h.keys
        list = list.append(n)
    end
    list.sort!
    ri, rj = list[0], list[-1]

    i, j = 0, 0 # list[i, j]
    set = 0
    hcnt = Hash.new{0} # h[i] = j 序列id已经有的数字数量
    for id in h[list[0]] 
        hcnt[id] += 1
        set += 1
    end

    while true
        if set == nums.size
            if list[j] - list[i] < rj - ri
                ri, rj = list[i], list[j]
            end
            to_rm = list[i]
            for id in h[to_rm]
                hcnt[id] -= 1
                if hcnt[id] == 0
                    set -= 1
                end
            end
            i += 1
        else
            j += 1
            if j > list.size
                break
            end
            to_add = list[j]
            for id in h[to_add]
                hcnt[id] += 1
                if hcnt[id] == 1
                    set += 1
                end
            end
        end
    end

    return [ri, rj]
end
# @lc code=end

if __FILE__ == $0
    puts "#{smallest_range [[4,10,15,24,26], [0,9,12,20], [5,18,22,30]] }"
    puts "#{smallest_range [[1,2,3],[1,2,3],[1,2,3]]}"
    puts "#{smallest_range [[10, 10], [11, 11]]}"
end
