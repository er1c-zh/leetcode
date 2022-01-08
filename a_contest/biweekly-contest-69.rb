# 1
# @param {String} title
# @return {String}
def capitalize_title(title)
    result = []
    title.split(" ").each{
        |s|
        s = s.downcase
        if s.length > 2
            s[0] = s[0].upcase
        end
        result.append s
    }
    return result.join(" ")
end

# 2
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer}
def pair_sum(head)
    arr = []
    while head != nil
        arr.append head.val
        head = head.next
    end
    result = 0
    i, j = 0, arr.length - 1
    while i < j
        if arr[i] + arr[j] > result
            result = arr[i] + arr[j]
        end
        i += 1
        j -= 1
    end
    return result
end

# 3
# @param {String[]} words
# @return {Integer}
def longest_palindrome(words)
    map = Hash.new{0}
    words.each{
        |w|
        map[w] += 1
    }
    result = 0
    has_single_mid = false
    map.keys.each{
        |w|
        if w != w.reverse
            s = map[w]
            t = map[w.reverse]
            cnt = (s > t ? t : s)
            map[w] -= cnt
            map[w.reverse] -= cnt
            result += 2 * cnt
        else
            cnt = map[w]
            if cnt % 2 == 0
                result += cnt
            else
                result += cnt - 1
                has_single_mid = true
            end
            map[w] = 0
        end
    }
    result += (has_single_mid ? 1 : 0)
    return result * 2 
end

# 4
# @param {Integer[][]} grid
# @param {Integer} stamp_height
# @param {Integer} stamp_width
# @return {Boolean}
def possible_to_stamp(grid, stamp_height, stamp_width)
    debug = false
    sh, sw = stamp_height, stamp_width
    m, n = grid.length, grid[0].length
    dp1 = Array.new(m){Array.new(n){0}} # dp1[i][j] [0, 0] - [i, j] 有多少个被占用的点
    grid.each_index{
        |i|
        grid[i].each_index{
            |j|
            dp1[i][j] = grid[i][j]
            if i == 0 && j == 0
                # do nothing
            elsif i == 0
                dp1[i][j] += dp1[i][j - 1]
            elsif j == 0
                dp1[i][j] += dp1[i - 1][j]
            else
                dp1[i][j] += dp1[i][j - 1]
                dp1[i][j] += dp1[i - 1][j]
                dp1[i][j] -= dp1[i - 1][j - 1]
            end
        }
    }
    if debug
        dp1.each{
            |v|
            puts "#{v}"
        }
        puts "==="
    end
    dp2 = Array.new(m){Array.new(n){0}} # dp2[i][j] [i, j] 是否可以贴
    dp1.each_index{
        |i|
        dp1[i].each_index{
            |j|
            _i, _j = i + sh - 1, j + sw - 1
            if _i >= m || _j >= n
                next
            end
            if debug && i == 1 && j == 1
                puts "#{_i}, #{_j}"
                puts "#{dp1[_i][j - 1]}"
                puts "#{dp1[i - 1][_j]}"
                puts "#{dp1[i - 1][j - 1]}"
            end
            cnt = dp1[_i][_j]
            if i == 0 && j == 0
                # do nothing
            elsif i == 0
                cnt -= dp1[_i][j - 1]
            elsif j == 0
                cnt -= dp1[i - 1][_j]
            else
                cnt -= dp1[_i][j - 1]
                cnt -= dp1[i - 1][_j]
                cnt += dp1[i - 1][j - 1]
            end
            dp2[i][j] = (cnt == 0 ? 1 : 0)
        }
    }

    if debug
        dp2.each{
            |v|
            puts "#{v}"
        }
        puts "==="
    end

    # dp1[i][j] (0, 0) - (i, j) 贴了的数量
    grid.each_index{
        |i|
        grid[i].each_index{
            |j|
            dp1[i][j] = dp2[i][j]
            if i == 0 && j == 0
                # do nothing
            elsif i == 0
                dp1[i][j] += dp1[i][j - 1]
            elsif j == 0
                dp1[i][j] += dp1[i - 1][j]
            else
                dp1[i][j] += dp1[i][j - 1]
                dp1[i][j] += dp1[i - 1][j]
                dp1[i][j] -= dp1[i - 1][j - 1]
            end
        }
    }

    if debug
        dp1.each{
            |v|
            puts "#{v}"
        }
    end

    grid.each_index{
        |i|
        grid[i].each_index{
            |j|
            if grid[i][j] == 1
                next
            end
            cur = dp1[i][j]
            _i, _j = i - sh + 1, j - sw + 1
            if debug && i == 0 && j == 3
                puts "==#{_i}, #{_j}"
            end
            if _i <= 0 && _j <= 0
                # do nothing
            elsif _i <= 0
                cur -= dp1[i][_j - 1]
            elsif _j <= 0
                cur -= dp1[_i - 1][j]
            else
                cur -= dp1[i][_j - 1]
                cur -= dp1[_i - 1][j]
                cur += dp1[_i - 1][_j - 1]
            end

            if cur == 0
                if debug
                    puts "#{i}, #{j}"
                end
                return false
            end
        }
    }
    return true
end

if __FILE__ == $0
    # puts "#{possible_to_stamp([[1,0,0,0],[1,0,0,0],[1,0,0,0],[1,0,0,0],[1,0,0,0]], 4, 3)}"
    puts "#{possible_to_stamp([[0,0,0,0],[0,0,0,0],[0,0,0,1]],3,3)}"
end