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
    if nums1.length < nums2.length
        nums1, nums2 = nums2, nums1
    end
    i, j, li, lj = 0, 0, nums1.length, nums2.length

    result = nil
    (0..k).each{
        |ci|
        cj = k - ci
        if ci > li || cj > lj
            next
        end
        if debug
            puts "ci, cj = #{ci} #{cj}"
        end
        p1, p2 = get_stack(nums1, ci), get_stack(nums2, cj)
        if debug
            puts "p1 #{p1}"
            puts "p2 #{p2}"
        end
        # merge
        tmp = []
        i, j = 0, 0
        while i < p1.length || j < p2.length
            if i < p1.length && j < p2.length
                if p1[i] > p2[j]
                    tmp.append p1[i]
                    i += 1
                elsif p1[i] < p2[j]
                    tmp.append p2[j]
                    j += 1
                else
                    delta = 0
                    done = false
                    _i, _j = i + delta, j + delta
                    while _i < p1.length && _j < p2.length
                        if p1[_i] > p2[_j]
                            done = true
                            tmp.append p1[i]
                            i += 1
                            break
                        elsif p1[_i] < p2[_j]
                            done = true
                            tmp.append p2[j]
                            j += 1
                            break
                        end
                        _i += 1
                        _j += 1
                    end
                    if done
                        next
                    else
                        if _i < p1.length
                            tmp.append p1[i]
                            i += 1
                        else
                            tmp.append p2[j]
                            j += 1
                        end
                    end
                end
            elsif i < p1.length
                tmp.append p1[i]
                i += 1
            elsif j < p2.length
                tmp.append p2[j]
                j += 1
            else
                puts "unreachable 1"
            end
        end
        if debug
            puts "tmp #{tmp} result #{result}"
        end
        # compare
        if result == nil
            result = tmp
        else
            change = false
            _i = 0
            while _i < tmp.length
                if tmp[_i] > result[_i]
                    change = true
                    break
                elsif tmp[_i] < result[_i]
                    break
                end
                _i += 1
            end
            if change
                result = tmp
            end
        end
    }

    return result
end

def get_stack(nums, k)
    stack = []
    nums.each_index{
        |idx|
        v = nums[idx]
        while stack.length > 0 && v > stack[-1] && k - stack.length < nums.length - idx
            stack.pop
        end
        if stack.length < k
            stack.append v
        end
    }
    return stack
end
# @lc code=end

if __FILE__ == $0
    # p max_number([3, 4, 6, 5], [9, 1, 2, 5, 8, 3], 5)
    # p max_number([6,7], [6,0,4], 5)
    # p max_number([3,9], [8,9], 3)
    # p max_number([8,0,4,4,1,7,3,6,5,9,3,6,6,0,2,5,1,7,7,7,8,7,1,4,4,5,4,8,7,6,2,2,9,4,7,5,6,2,2,8,4,6,0,4,7,8,9,1,7,0],[6,9,8,1,1,5,7,3,1,3,3,4,9,2,8,0,6,9,3,3,7,8,3,4,2,4,7,4,5,7,7,2,5,6,3,6,7,0,3,5,3,2,8,1,6,6,1,0,8,4], 50)
    p max_number([2,5,6,4,4,0],[7,3,8,0,6,5,7,6,2],15)
    # #p max_number()
end
