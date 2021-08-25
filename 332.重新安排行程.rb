#
# @lc app=leetcode.cn id=332 lang=ruby
#
# [332] 重新安排行程
#

# @lc code=start
# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
    debug = false
    nodes = Hash.new
    tickets.each{
        |t|
        nodes[t[0]] = true
        nodes[t[1]] = true
    }
    cnt = 0
    id2str = Array.new(nodes.size)
    nodes.keys.sort.each{
        |airport|
        nodes[airport] = cnt
        id2str[cnt] = airport
        cnt += 1
    }
    if debug
        p id2str
        p nodes
    end
    c = nodes.size
    m = Array.new(c){Array.new(c){0}}
    tickets.each{
        |t|
        m[nodes[t[0]]][nodes[t[1]]] += 1
    }
    if debug
        m.each{
            |v|
            p v
        }
    end
    result = []
    helper(nodes["JFK"], m, tickets.length).each{
        |v|
        result.append(id2str[v])
    }
    return result
end
def helper(f, m, ticketCnt)
    if ticketCnt == 0
        return [f]
    end
    m[f].each_index{
        |t|
        if m[f][t] != 0
            m[f][t] -= 1
            r = helper(t, m, ticketCnt - 1)
            if r != nil
                return [f] + r
            end
            m[f][t] += 1
        end
    }
    return nil
end
# @lc code=end

if __FILE__ == $0
    p find_itinerary([["EZE","AXA"],["TIA","ANU"],["ANU","JFK"],["JFK","ANU"],["ANU","EZE"],["TIA","ANU"],["AXA","TIA"],["TIA","JFK"],["ANU","TIA"],["JFK","TIA"]])
    #p find_itinerary([["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]])
    #p find_itinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
    #p find_itinerary()
end
