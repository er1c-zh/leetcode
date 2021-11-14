# 1
# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
    l = tickets[k]
    result = 0
    tickets.each_index{
        |i|
        result += [tickets[i], l + (i > k ? -1 : 0)].min
    }
    return result
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
# @return {ListNode}
def reverse_even_length_groups(head)
    l = 1
    result = head
    cur = head
    pre = nil
    while cur != nil
        start = cur
        tail = nil
        i = 0
        while i < l && cur != nil
            tail = cur
            cur = cur.next
            i += 1
        end
        if i > 0 && i % 2 == 0
            # reverse [start, tail]
            tail.next = nil
            _c = start
            _tail = nil
            _pre = nil
            while _c.next != nil
                if _tail == nil
                    _tail = _c
                end
                tmp = _c.next
                _c.next = _pre
                _pre = _c
                _c = tmp
            end
            _c.next = _pre
            tail = _tail
            start = _c
        end
        if pre != nil
            pre.next = start
        end
        pre = tail
        l += 1
    end
    return result
end

# 3
# @param {String} encoded_text
# @param {Integer} rows
# @return {String}
def decode_ciphertext(encoded_text, rows)
    if rows == 1 || encoded_text == ""
        return encoded_text
    end
    len = encoded_text.length
    cols = encoded_text.length / rows
    if encoded_text.length % rows != 0
        puts "unexpected err"
        return ""
    end
    i = 0
    result = ""
    done = false
    while !done
        j = 0
        while j < rows
            offset = i + (j * cols + j)
            if offset < len
                result += encoded_text[offset]
            else
                done = true
                break
            end
            j += 1
        end
        i += 1
    end
    return result.rstrip
end

# 4
# @param {Integer} n
# @param {Integer[][]} restrictions
# @param {Integer[][]} requests
# @return {Boolean[]}
def friend_requests(n, restrictions, requests)
end

if __FILE__ == $0
    puts "#{friend_requests(5 ,[[0,1],[1,2],[2,3]] ,[[0,4],[1,2],[3,1],[3,4]])}"
    # puts "#{friend_requests()}"
end