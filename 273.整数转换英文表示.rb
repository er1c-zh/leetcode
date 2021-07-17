#
# @lc app=leetcode.cn id=273 lang=ruby
#
# [273] 整数转换英文表示
#

# @lc code=start
# @param {Integer} num
# @return {String}
def number_to_words(num)
    if num == 0
        return "Zero"
    end
    temp = Hash.new
    temp['Billion'] = 1000000000
    temp['Million'] = 1000000
    temp['Thousand'] = 1000
    temp[''] = 1

    intToStr = Hash.new
    intToStr[0] = ''
    intToStr[1] = 'One'
    intToStr[2] = 'Two'
    intToStr[3] = 'Three'
    intToStr[4] = 'Four'
    intToStr[5] = 'Five'
    intToStr[6] = 'Six'
    intToStr[7] = 'Seven'
    intToStr[8] = 'Eight'
    intToStr[9] = 'Nine'
    intToStr[10] = 'Ten'
    intToStr[11] = 'Eleven'
    intToStr[12] = 'Twelve'
    intToStr[13] = 'Thirteen'
    intToStr[14] = 'Fourteen'
    intToStr[15] = 'Fifteen'
    intToStr[16] = 'Sixteen'
    intToStr[17] = 'Seventeen'
    intToStr[18] = 'Eighteen'
    intToStr[19] = 'Nineteen'
    intToStr[20] = 'Twenty'
    intToStr[30] = 'Thirty'
    intToStr[40] = 'Forty'
    intToStr[50] = 'Fifty'
    intToStr[60] = 'Sixty'
    intToStr[70] = 'Seventy'
    intToStr[80] = 'Eighty'
    intToStr[90] = 'Ninety'

    result = ""

    temp.each{
        |key, val|
        _v = (num / val) % 1000
        # puts "key #{key} val #{val} _v #{_v}"
        if _v / 100 != 0
            result = append(result, intToStr[_v / 100] + ' Hundred')
        end
        __v = _v % 100
        # puts "__v #{__v} __v / 10 #{__v / 10} intToStr. #{intToStr[__v / 10]}"
        if __v < 20
            result = append(result, intToStr[__v])
        elsif  __v >= 20
            result = append(result, intToStr[__v / 10 * 10])
            result = append(result, intToStr[__v % 10])
        end
        if _v != 0
            result = append result, key
        end
    }

    return result
end

def append(to, src)
    if src == ''
        return to
    end
    if to != ''
        return to + ' ' + src
    else
        return src
    end
end
# @lc code=end

