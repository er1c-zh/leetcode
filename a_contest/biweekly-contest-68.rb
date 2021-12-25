# 1
# @param {String[]} sentences
# @return {Integer}
def most_words_found(sentences)
    result = 0
    sentences.each{
        |s|
        tmp = s.split(" ").length
        if tmp > result
            result = tmp
        end
    }
    return result
end

# 2
# @param {String[]} recipes
# @param {String[][]} ingredients
# @param {String[]} supplies
# @return {String[]}
def find_all_recipes(recipes, ingredients, supplies)
    has = Hash.new
    supplies.each{
        |i|
        has[i] = true
    }
    mapper = Hash.new
    canMade = Hash.new
    recipes.each{
        |i|
        canMade[i] = []
    }
    needSelfMade = Hash.new
    i = 0
    queue = []
    while i < recipes.length
        r = recipes[i]
        mapper[r] = [i, ingredients[i]]
        needSelfMade[r] = 0
        ingredients[i].each{
            |need|
            if canMade[need] != nil
                needSelfMade[r] += 1
                canMade[need].append r
            end
        }
        if needSelfMade[r] == 0
            queue.append(i)
        end
        i += 1
    end
    result = []
    while !queue.empty?
        i = queue[0]
        cur = recipes[i]
        queue = queue[1..-1]
        can = true
        ingredients[i].each{
            |need|
            if has[need] == nil
                can = false
                break
            end
        }
        if can
            result.append cur
            has[cur] = true
            canMade[cur].each{
                |toCheck|
                needSelfMade[toCheck] -= 1
                if needSelfMade[toCheck] == 0
                    queue.append mapper[toCheck][0]
                end
            }
        end
    end
    return result
end

# 3
# @param {String} s
# @param {String} locked
# @return {Boolean}
def can_be_valid(s, locked)
    l = s.length
    dp = Array.new(l){Array.new(l)}
    return helper3(s, locked, 0, s.length - 1, dp)
end
def helper3(s, locked, i, j, dp)
    if dp[i][j] != nil
        return dp[i][j]
    end
    l = j - i + 1
    if l % 2 == 1
        dp[i][j] = false
        return false
    end
    if l == 2
        dp[i][j] = (locked[i] == "0" || s[i] == "(") && (locked[j] == "0" || s[j] == ")")
        return dp[i][j]
    end
    if (locked[i] == "0" || s[i] == "(") && (locked[j] == "0" || s[j] == ")")
        if helper3(s, locked, i + 1, j - 1, dp)
            dp[i][j] == true
            return true
        end
    end
    k = i + 1
    while k + 1 <= j
        if helper3(s, locked, i, k, dp) && helper3(s, locked, k + 1, j, dp)
            dp[i][j] == true
            return true
        end
        k += 2
    end
    dp[i][j] = false
    return false
end
def can_be_valid1(s, locked)
    l = s.length
    if l % 2 == 1
        return false
    end
    dp = Array.new(l){Array.new(l)}

    d = 1
    while d < l 
        i = 0
        while i + d < l
            j = i + d
            # [i, j]
            dp[i][j] = false
            _l = j - i + 1
            # if _l % 2 == 1
            #     i += 1
            #     next
            # end
            if _l == 2
                if (locked[i] == "0" || s[i] == "(") && (locked[j] == "0" || s[j] == ")")
                    dp[i][j] = true
                end
                i += 1
                next
            end
            # (other)
            if (locked[i] == "0" || s[i] == "(") && (locked[j] == "0" || s[j] == ")") && dp[i + 1][j - 1] == true
                dp[i][j] = true
                i += 1
                next
            end
            # 分割 k [i, k], [k + 1, j]
            k = i + 1
            while k + 1 <= j
                if dp[i][k] && dp[k + 1][j]
                    dp[i][j] = true
                    break
                end
                k += 2
            end
            i += 1
        end
        d += 2
    end

    return dp[0][l - 1]
end

# 4

if __FILE__ == $0
    # puts "#{can_be_valid("))()))", "010100")}"
    puts "#{can_be_valid("()()", "0000")}"
end