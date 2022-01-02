# 1
# @param {String} s
# @return {Boolean}
def check_string(s)
    foundA = false
    (0..s.length - 1).each{
        |n|
        n = s.length - 1 - n
        if foundA && s[n] == "b"
            return false
        elsif !foundA && s[n] == "a"
            foundA = true
        end
    }
    return true
end

# 2
# @param {String[]} bank
# @return {Integer}
def number_of_beams(bank)
    result = 0
    pre = 0
    bank.each{
        |s|
        cnt = 0
        (0..s.length - 1).each{
            |i|
            if s[i] == "1"
                cnt += 1
            end
        }
        result += pre * cnt
        if cnt != 0
            pre = cnt
        end
    }
    return result
end

# 3
# @param {Integer} mass
# @param {Integer[]} asteroids
# @return {Boolean}
def asteroids_destroyed(mass, asteroids)
    asteroids.sort.each{
        |v|
        if mass < v
            return false
        end
        mass += v
    }
    return true
end

# 4
# @param {Integer[]} favorite
# @return {Integer}
def maximum_invitations(favorite)
    result = 0
    m = Hash.new # m[i] 查询i被谁喜欢
    favorite.each_index{
        |from|
        # from love to
        to = favorite[from]
        if m[to] == nil
            m[to] = []
        end
        m[to].append from
    }

    # puts "#{m}"

    one_set = Hash.new
    favorite.each_index{
        |from|
        # from love to
        to = favorite[from]
        if one_set[from] != nil || one_set[to] != nil
            next
        end
        if favorite[to] == from
            one_set[to] = true
            one_set[from] = true
            # TODO 查找 to和from的最长no-loop路径
            fmax, longest_no_loop = helper4(m, from, to)
            tmax, longest_no_loop = helper4(m, to, from)
            result += fmax + tmax
        end
    }
    # TODO 查找最长环
    favorite.each_index{
        |i|
        step = 0
        queue = [i]
        steps = Hash.new
        steps[i] = step
        while !queue.empty?
            nq = []
            step += 1
            queue.each{
                |j|
                if m[j] == nil
                    next
                end
                m[j].each{
                    |k|
                    if steps[k] != nil
                        if result < step - steps[k]
                            result = step - steps[k]
                        end
                    else
                        steps[k] = step
                        nq.append k
                    end
                }
            }
            queue = nq
        end
    }

    return result
end

def helper4(m, i, exclude)
    set = Hash.new
    queue = [i]
    set[i] = true
    set[exclude] = true
    result = 0
    while !queue.empty?
        nq = []
        queue.each{
            |j|
            if m[j] == nil
                next
            end
            m[j].each{
                |k|
                if set[k] != nil
                    next
                end
                nq.append k
            }
        }
        result += 1
        queue = nq
    end
    return result
end

if __FILE__ == $0
    # puts "#{maximum_invitations [2,2,1,2]}"
    # puts "#{maximum_invitations [1,2,0]}"
    # puts "#{maximum_invitations [1,0,3,2,5,6,7,4,9,8,11,10,11,12,10]}"
    puts "#{maximum_invitations [6,4,7,8,13,12,7,5,6,7,5,10,2,3]}"
end