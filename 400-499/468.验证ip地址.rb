#
# @lc app=leetcode.cn id=468 lang=ruby
#
# [468] 验证IP地址
#

# @lc code=start
# @param {String} query_ip
# @return {String}
def valid_ip_address(query_ip)
    if query_ip.index(".") != nil
        # ipv4 maybe
        if /[^\d\.]/.match(query_ip) != nil
            return "Neither"
        end
        seg_list = query_ip.split(".", -1)
        if seg_list.length != 4
            return "Neither"
        end
        seg_list.each{
            |v|
            i = v.to_i
            if v != i.to_s || i < 0 || i > 255
                return "Neither"
            end
        }
        return "IPv4"
    elsif query_ip.index(":") != nil
        # ipv6 maybe
        if /[^\da-fA-F\:]/.match(query_ip) != nil
            return "Neither"
        end
        seg_list = query_ip.split(":", -1)
        if seg_list.length != 8
            return "Neither"
        end
        seg_list.each{
            |v|
            if v.length > 4 || v.length <= 0
                return "Neither"
            end
        }
        return "IPv6"
    end
    return "Neither"
end
# @lc code=end

if __FILE__ == $0
    puts "#{valid_ip_address "172.16.254.1"}"
    puts "#{valid_ip_address "2001:0db8:85a3:0:0:8A2E:0370:7334"}"
    puts "#{valid_ip_address "256.256.256.256"}"
    puts "#{valid_ip_address "172.16.254.1."}"
    puts "#{valid_ip_address "2001:0db8:85a3:0:0:8A2E:0370:7334:"}"
    puts "#{valid_ip_address "01.01.01.01"}"
end
