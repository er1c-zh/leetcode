# 1
def count_quadruplets(nums)
    m = Hash.new
    v1, v2, v3 = nums[0], nums[1]
    m[1] = [[v1], [v2]]
    m[2] = [[v1, v2]]
    m[3] = []
    cnts = Hash.new{0}
    cnt = 0
    (2..nums.length - 1).each{
        |idx|
        v = nums[idx]
        cnt += cnts[v]
        (0..2).each{
            |_i|
            i = 3 - _i
            if i == 1
                m[1] = m[1].append [v]
            elsif i == 3
                m[i - 1].each{
                    |_v|
                    sum = 0
                    _v.each{
                        |__v|
                        sum += __v
                    }
                    m[i] = m[i].append(_v + [v])
                    cnts[sum + v] += 1
                }
            else
                m[i - 1].each{
                    |_v|
                    m[i] = m[i].append(_v + [v])
                }
            end
        }
    }
    return cnt
end

# 2
def number_of_weak_characters(properties)
    nums = Hash.new
    num2fake = Hash.new
    properties.each{
        |v|
        nums[v[0]] = true
    }
    nums = nums.keys.sort
    nums.each_index{
        |idx|
        num2fake[nums[idx]] = idx
    }

    dp = Array.new{0} # dp[i] 攻击大于i的防御最大值

    properties.sort!{
        |x, y|
        y[0] <=> x[0]
    }
    
    dp[nums.length] = 0
    # puts "#{num2fake}, #{dp}"
    properties.each{
        |v|
        a, d = num2fake[v[0]], v[1]
        if dp[a] == nil
            dp[a] = dp[a + 1]
        end
        if dp[a] < d
            dp[a] = d
        end
    }
    # puts "#{dp}"

    cnt = 0
    properties.each{
        |v|
        af = num2fake[v[0]]
        if v[1] < dp[af + 1]
            cnt += 1
        end
    }
    return cnt
end

# 3

def first_day_been_in_all_rooms(next_visit)
    n = next_visit.length
    dp = Array.new(n){-1} # dp[i] 从0节点到i节点需要的天数
    i, cnt = 0, 0
    while i < n - 1
        nv = next_visit[i]
        dp[i] = cnt
        if nv == i
            cnt += 2
            cnt = cnt % (1e9 + 7)
        else
            if cnt < (1e9 + 7)
                cnt += 1e9 + 7
            end
            cnt += 2 + (cnt - dp[nv])
            cnt %= (1e9 + 7)
        end
        i += 1
    end

    # puts "===#{dp}"

    return (cnt % (1e9 + 7)).to_i
end

# 4

if __FILE__ == $0
    # p number_of_weak_characters([[5,5],[6,3],[3,6]])
    # p number_of_weak_characters([[2,2],[3,3]])
    # p number_of_weak_characters([[1,5],[10,4],[4,3]])
    # p number_of_weak_characters([[1,1],[2,1],[2,2],[1,2]])
    p first_day_been_in_all_rooms([0,0])
    p first_day_been_in_all_rooms([0,0,2])
    p first_day_been_in_all_rooms([0,1,2,0])
    # p number_of_weak_characters()
    # p count_quadruplets([1,2,3,6])
    # p count_quadruplets([3,3,6,4,5])
    # p count_quadruplets([1,1,1,3,5])
end