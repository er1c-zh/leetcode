# 1
# @param {String} sentence
# @return {Integer}
def count_valid_words(sentence)
    result = 0
    sentence.split(' ').each{
        |str|
        if str.length == 0
            next
        end
        ok = true
        cntConn = 0
        (0..str.length - 1).each{
            |i|
            c = str[i]
            if c >= '0' && c <= '9'
                ok = false
                break
            elsif c == '-'
                if cntConn != 0
                    ok = false
                    break
                end
                if i == 0 || i == str.length - 1
                    ok = false
                    break
                end
                if !(str[i + 1] >= 'a' && str[i + 1] <= 'z')
                    ok = false
                    break
                end
                cntConn += 1
            elsif (c == "." or c == "!" or c == ",") && i != str.length - 1
                ok = false
                break
            end
        }
        if ok
            result += 1
        end
    }
    return result
end

# 2
# @param {Integer} n
# @return {Integer}
def next_beautiful_number(n)
    if n == 0
        return 1
    end
    if n < 22
        return 22
    end
    set = [0, 1, 22, 333, 4444, 55555, 666666, 7777777]
    solutions = [[], [], [], [[1, 2]], [[1, 3]], [[1, 4], [2, 3]], [[1, 5], [2, 4], [1, 2, 3]], [[1, 6], [2, 5], [3, 4], [1, 2, 4]]]

    set.each_index{
        |i|
        if n >= set[i]
            next
        end
        x, y = 1, i - 1
        result = set[i]
        while x < y
            vx, vy = set[x], set[y]
            if n >= vy * (10 ** x) + vx
                break
            end
            solutions[i].each{
                |solution|
                arg = []
                solution.each{
                    |v|
                    arg.append [v, v]
                }
                tmp = helper2(arg, 0, n)
                if tmp != nil && result > tmp
                    result = tmp
                end
            }
            x += 1
            y -= 1
        end
        return result
    }

end

def helper2(vals, pre, target)
    all_zero = true
    vals.each{
        |v|
        if v[1] < 0
            return nil
        end
        if v[1] > 0
            all_zero = false
        end
    }
    # vx < vy
    if all_zero == true
        if pre > target
            return pre
        else
            return nil
        end
    end

    vals.each_index{
        |idx|
        item = vals[idx]
        i = item[0]
        v = item[1]
        if v == 0
            next
        end
        vals[idx][1] -= 1
        r = helper2(vals, pre * 10 + i, target)
        if r != nil
            return r
        end
        vals[idx][1] += 1
    }
    return nil
end

# 3
# @param {Integer[]} parents
# @return {Integer}
def count_highest_score_nodes(parents)
    n = parents.length
    childrens = Array.new(n){[]}
    cnts = Array.new(n){0}
    parents.each_index{
        |child|
        parent = parents[child]
        if parent == -1
            next
        end
        childrens[parent].append child
        cnts[parent] += 1
    }
    queue = []
    cnts.each_index{
        |node|
        if cnts[node] == 0
            queue.append node
        end
    }
    while !queue.empty?
        cur = queue[0]
        queue = queue[1..-1]
        cnts[cur] = 1
        childrens[cur].each{
            |child|
            cnts[cur] += cnts[child]
        }
        parent = parents[cur]
        cnts[parent] -= 1
        if cnts[parent] == 0
            queue.append parent
        end
    end
    result = 0
    (0..n-1).each{
        |node|
        r = 1
        childrens[node].each{
            |child|
            r *= cnts[child]
        }
        parent = parents[node]
        if parent != -1
            r *= (cnts[parent] - cnts[node])
        end
        if r > result
            result = r
        end
    }
    return r
end

# 4

if __FILE__ == $0
   # puts "#{count_valid_words "cat and  dog"}"
   # puts "#{count_valid_words "!this  1-s b8d!"}"
   # puts "#{count_valid_words "alice and  bob are playing stone-game10"}"
   # puts "#{count_valid_words "he bought 2 pencils, 3 erasers, and 1  pencil-sharpener."}"
   # puts "#{count_valid_words ""}"
   # puts "#{next_beautiful_number 1}"
   # puts "#{next_beautiful_number 1000}"
   # puts "#{next_beautiful_number 3000}"
   # puts "#{next_beautiful_number 1e6}"
   # puts "#{next_beautiful_number 29160}"
   # puts "#{next_beautiful_number 59866}"
   # puts "#{next_beautiful_number }"
end