# 1
# @param {String} word1
# @param {String} word2
# @return {Boolean}
def check_almost_equivalent(word1, word2)
    vals = Hash.new{0}
    result = true
    (0..word1.length-1).each{
        |i|
        vals[word1[i]] += 1
    }
    (0..word2.length-1).each{
        |i|
        vals[word2[i]] -= 1
    }
    vals.keys.each{
        |k|
        if vals[k] < -3 || vals[k] > 3
            result = false
            break
        end
    }
    return result
end

# 2
class Robot

=begin
    :type width: Integer
    :type height: Integer
=end
    def initialize(width, height)
        @w, @h = width, height
        @total = 2 * @w + 2 * @h - 4
        @actions = [
            [1, 0],
            [0, 1],
            [-1, 0],
            [0, -1],
        ]
        @dir = Hash.new
        @dir[0] = "East"
        @dir[1] = "North"
        @dir[2] = "West"
        @dir[3] = "South"
        @idx = 0
        @x, @y = 0, 0
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def move(num)
        num = num % @total
        if num == 0
            num = @total
        end
        action = @actions[@idx]
        dx, dy = action[0], action[1]
        x, y = @x, @y
        while num > 0
            nx, ny = x + dx, y + dy
            if nx < 0 || nx == @w || ny < 0 || ny == @h
                @idx += 1
                if @idx == 4
                    @idx = 0
                end
                action = @actions[@idx]
                dx, dy = action[0], action[1]
            else
                x, y = nx, ny
                num -= 1
            end
        end
        @x, @y = x, y
    end


=begin
    :rtype: Integer[]
=end
    def get_pos()
        return [@x, @y]
    end


=begin
    :rtype: String
=end
    def get_dir()
        return @dir[@idx]
    end

# Your Robot object will be instantiated and called as such:
# obj = Robot.new(width, height)
# obj.move(num)
# param_2 = obj.get_pos()
# param_3 = obj.get_dir()

end

# 3
# @param {Integer[][]} items
# @param {Integer[]} queries
# @return {Integer[]}
def maximum_beauty(items, queries)
    priceSet = Hash.new
    items.each{
        |v|
        priceSet[v[0]] = nil
    }
    queries.each{
        |v|
        priceSet[v] = nil
    }
    prices = priceSet.keys.sort
    prices.each_index{
        |i|
        priceSet[prices[i]] = i
    }

    items.sort!{
        |x, y|
        if x[0] == y[0]
            y[1] <=> x[1]
        else
            x[0] <=> y[0]
        end
    }
    # puts "#{items}"
    dp = Array.new(prices.length){0}
    i, j = 0, 0
    # dp[i]
    # items[j]
    while i < dp.length
        if j >= items.length
            dp[i] = dp[i - 1]
            i += 1
            next
        end
        if i > 0
            dp[i] = dp[i - 1]
        end
        while j < items.length && i >= priceSet[items[j][0]]
            if items[j][1] > dp[i]
                dp[i] = items[j][1]
            end
            j += 1
        end
        i += 1
    end
    # puts "#{dp}"
    # puts "#{prices}"
    result = []
    queries.each{
        |v|
        result.append dp[priceSet[v]]
    }
    return result
end

# 4
# @param {Integer[]} tasks
# @param {Integer[]} workers
# @param {Integer} pills
# @param {Integer} strength
# @return {Integer}
def max_task_assign(tasks, workers, pills, strength)
    # dfs 记忆化搜索
    tasks.sort!
    workers.sort!
    cache = Hash.new{Hash.new{Hash.new}} # cache[ti][wi][pill_cnt]
    stack = [[0, 0, pills]]
    result = 0
    while !stack.empty
        cur = stack.pop
        ti, wi, cnt = cur[0], cur[1], cur[2]
        task, worker = tasks[ti], workers[wi]
        if task <= worker
    end
    return result
end

if __FILE__ == $0
    puts "#{maximum_beauty([[1,2],[3,2],[2,4],[5,6],[3,5]],[1,2,3,4,5,6])}"
end