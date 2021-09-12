
# 1
# @param {Integer[]} nums
# @return {Integer}
def find_middle_index(nums)
    sum = 0
    nums.each{
        |v|
        sum += v
    }
    pre, idx = 0, 0
    while idx <= nums.length - 1
        if pre == sum - pre - nums[idx]
            return idx
        end
        pre += nums[idx]
        idx += 1
    end
    return -1
end

# 2
# @param {Integer[][]} land
# @return {Integer[][]}
def find_farmland(land)
    m, n = land.length, land[0].length
    mask = Array.new(m){Array.new(n){0}}
    result = []
    land.each_index{
        |i|
        land[i].each_index{
            |j|
            if mask[i][j] != 0
                next
            end
            if land[i][j] != 1
                next
            end
            _i, _j = i + 1, j + 1
            while _i < m && land[_i][j] == 1
                _i += 1
            end
            while _j < n && land[i][_j] == 1
                _j += 1
            end
            result.append([i, j, _i - 1, _j - 1])
            (i.._i - 1).each{
                |a|
                (j.._j - 1).each{
                    |b|
                    mask[a][b] = 1
                }
            }
        }
    }
    return result
end

class LockingTree
    attr_accessor :parent, :m, :parent_to_children

    def initialize(parent)
        @parent, @m = parent, Array.new(parent.length){nil}
        @parent_to_children = Hash.new{Array.new}
        @parent.each_index{
            |child|
            @parent_to_children[@parent[child]] = @parent_to_children[@parent[child]].append(child)
        }
        puts "#{@parent_to_children}"
    end


    def lock(num, user)
        if @m[num] != nil
            return false
        end
        @m[num] = user
        return true
    end


    def unlock(num, user)
        if @m[num] != user
            return false
        end
        @m[num] = nil
        return true
    end


    def upgrade(num, user)
        cur = num
        while cur != -1
            if @m[cur] != nil
                return false
            end
            cur = @parent[cur]
        end
        found = false
        q = []
        @parent_to_children[num].each{
            |v|
            q.append(v)
        }
        while !q.empty?
            child = q.pop
            q += @parent_to_children[child]
            if @m[child] == nil
                next
            end
            found = true
            @m[child] = nil
        end
        if found
            @m[num] = user
        end
        return found
    end

end

# Your LockingTree object will be instantiated and called as such:
# obj = LockingTree.new(parent)
# param_1 = obj.lock(num, user)
# param_2 = obj.unlock(num, user)
# param_3 = obj.upgrade(num, user)

# 4
# @param {Integer[]} nums
# @return {Integer}
def number_of_good_subsets(nums)
    temp = Hash.new
    ps = [2,3,5,7,11,13,17,19,23,29]
    ps.each{
        |v|
        temp[v] = 1 << v
    }
    ps.each_index{
        |i|
        j = i + 1
        while j < ps.length
            v = ps[i] * ps[j]
            if v > 30
                break
            end
            temp[v] = (1 << ps[i]) | (1 << ps[j])
            j += 1
        end
    }
    temp[30] = temp[2] | temp[3] | temp[5]

    one_cnt = 0
    cnts = Hash.new{0}
    nums.each{
        |v|
        if v == 1
            one_cnt += 1
        end
        if temp[v] == nil 
            next
        end
        cnts[v] += 1
    }

    keys = cnts.keys.sort
    v1 = helper(0, keys, 0, temp, cnts)
    (1..one_cnt).each{
        |_|
        v1 = v1 * 2
        v1 = v1 % (1e9 + 7)
    }
    if true
        # puts "#{cnts}"
        # temp.keys.each{
        #     |key|
        #     puts "#{key} #{temp[key].to_s(2)}"
        # }
        # puts "#{keys}"
        # puts "#{v1} #{one_cnt} = #{v2}"
    end
    return v1.to_i
end

def helper(pre, keys, i, temp, cnts)
    if i >= keys.length
        return (pre > 0) ? 1 : 0
    end
    cnt = 0
    v = keys[i]
    # use
    if pre & temp[v] == 0
        cnt += cnts[v] * helper(pre | temp[v], keys, i + 1, temp, cnts)
        cnt = cnt % (1e9 + 7)
    end
    # not use
    cnt += helper(pre, keys, i + 1, temp, cnts)
    cnt = cnt % (1e9 + 7)
    return cnt
end

if __FILE__ == $0
    puts "hello biweekly-contest"
    # puts find_middle_index([2,3,-1,8,4])
    # p find_farmland([[1,0,0],[0,1,1],[0,1,1]])
    p number_of_good_subsets([1,2,3,4])
    p number_of_good_subsets([4,2,3,15])
    # puts "#{[10,11,5,1,10,1,3,1,26,11,6,1,1,15,1,7,22,1,1,1,1,1,23,1,29,5,6,1,1,29,1,1,21,19,1,1,1,2,1,11,1,15,1,22,14,1,1,1,1,6,7,1,14,3,5,1,22,1,1,1,17,1,29,2,1,15,10,1,5,7,1,1,1,30,1,30,1,21,10,1,1,1,1,1,2,6,5,7,3,1,1,19,29,1,7,13,14,1,5,26,19,11,1,1,1,1,1,1,1,1,22,15,1,1,13,1,17,1,1,1,13,6,1,10,1,1,17,1,1,3,14,7,17,1,13,1,1,1,1,1,11,1,1,6,1,1,1,1,1,2,1,30,2,26,1,1,14,1,26,29,30,1,13,21,1,1,14,21,1,23,1,15,23,21,1,30,19,19,1,10,23,3,3,17,22,2,26,1,11,1,23,1,1,1,15,1,1,13,1,1].sort}"
end