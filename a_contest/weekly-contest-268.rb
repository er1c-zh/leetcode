# 1
# @param {Integer[]} colors
# @return {Integer}
def max_distance(colors)
    result = 0
    l = colors.length
    colors.each_index{
        |i|
        j = l - 1
        while j > i
            if colors[j] == colors[i]
                j -= 1
                next
            end
            if j - i > result
                result = j - i
            end
            break
        end
    }
    return result
end

# 2
# @param {Integer[]} plants
# @param {Integer} capacity
# @return {Integer}
def watering_plants(plants, capacity)
    result = 0
    cur = capacity
    plants.each_index{
        |i|
        if cur >= plants[i]
            result += 1
            cur -= plants[i]
        else
            result += i + i + 1
            cur = capacity - plants[i]
        end
    }
    return result
end

# 3
class RangeFreqQuery

=begin
    :type arr: Integer[]
=end
    def initialize(arr)
        @prefix = Hash.new(){Array.new}
        arr.each_index{
            |i|
            @prefix[arr[i]] = @prefix[arr[i]].append i
        }
    end


=begin
    :type left: Integer
    :type right: Integer
    :type value: Integer
    :rtype: Integer
=end
    def query(left, right, value)
        arr = @prefix[value]
        if arr.length == 0
            return 0
        end
        if arr[arr.length - 1] < left || arr[0] > right
            return 0
        end
        li, ri = 0, 0
        i, j = 0, arr.length - 1
        while i < j
            mid = (i + j) / 2
            if arr[mid] < left
                i = mid + 1
            else
                j = mid
            end
        end
        li = i
        # find ri
        i, j = 0, arr.length
        while i + 1 < j
            mid = (i + j) / 2
            if arr[mid] <= right
                i = mid
            else
                j = mid
            end
        end
        ri = i
        return ri - li + 1
    end

end

# Your RangeFreqQuery object will be instantiated and called as such:
# obj = RangeFreqQuery.new(arr)
# param_1 = obj.query(left, right, value)

# 4
# @param {Integer} k
# @param {Integer} n
# @return {Integer}
def k_mirror(k, n)
    m = Array.new(10){Array.new(31){0}}
    m[2][1]=1
    m[2][2]=4
    m[2][3]=9
    m[2][4]=16
    m[2][5]=25
    m[2][6]=58
    m[2][7]=157
    m[2][8]=470
    m[2][9]=1055
    m[2][10]=1772
    m[2][11]=9219
    m[2][12]=18228
    m[2][13]=33579
    m[2][14]=65802
    m[2][15]=105795
    m[2][16]=159030
    m[2][17]=212865
    m[2][18]=286602
    m[2][19]=872187
    m[2][20]=2630758
    m[2][21]=4565149
    m[2][22]=6544940
    m[2][23]=9674153
    m[2][24]=14745858
    m[2][25]=20005383
    m[2][26]=25846868
    m[2][27]=39347399
    m[2][28]=759196316
    m[2][29]=1669569335
    m[2][30]=2609044274
    m[3][1]=1
    m[3][2]=3
    m[3][3]=7
    m[3][4]=15
    m[3][5]=136
    m[3][6]=287
    m[3][7]=499
    m[3][8]=741
    m[3][9]=1225
    m[3][10]=1881
    m[3][11]=2638
    m[3][12]=31730
    m[3][13]=80614
    m[3][14]=155261
    m[3][15]=230718
    m[3][16]=306985
    m[3][17]=399914
    m[3][18]=493653
    m[3][19]=1342501
    m[3][20]=2863752
    m[3][21]=5849644
    m[3][22]=9871848
    m[3][23]=14090972
    m[3][24]=18342496
    m[3][25]=22630320
    m[3][26]=28367695
    m[3][27]=36243482
    m[3][28]=44192979
    m[3][29]=71904751
    m[3][30]=155059889
    m[4][1]=1
    m[4][2]=3
    m[4][3]=6
    m[4][4]=11
    m[4][5]=66
    m[4][6]=439
    m[4][7]=832
    m[4][8]=1498
    m[4][9]=2285
    m[4][10]=3224
    m[4][11]=11221
    m[4][12]=64456
    m[4][13]=119711
    m[4][14]=175366
    m[4][15]=233041
    m[4][16]=739646
    m[4][17]=2540727
    m[4][18]=4755849
    m[4][19]=8582132
    m[4][20]=12448815
    m[4][21]=17500320
    m[4][22]=22726545
    m[4][23]=27986070
    m[4][24]=33283995
    m[4][25]=38898160
    m[4][26]=44577925
    m[4][27]=98400760
    m[4][28]=721411086
    m[4][29]=1676067545
    m[4][30]=53393239260
    m[5][1]=1
    m[5][2]=3
    m[5][3]=6
    m[5][4]=10
    m[5][5]=16
    m[5][6]=104
    m[5][7]=356
    m[5][8]=638
    m[5][9]=1264
    m[5][10]=1940
    m[5][11]=3161
    m[5][12]=18912
    m[5][13]=37793
    m[5][14]=10125794
    m[5][15]=20526195
    m[5][16]=48237967
    m[5][17]=78560270
    m[5][18]=126193944
    m[5][19]=192171900
    m[5][20]=1000828708
    m[5][21]=1832161846
    m[5][22]=2664029984
    m[5][23]=3500161622
    m[5][24]=4336343260
    m[5][25]=6849225412
    m[5][26]=9446112364
    m[5][27]=12339666346
    m[5][28]=19101218022
    m[5][29]=31215959143
    m[5][30]=43401017264
    m[6][1]=1
    m[6][2]=3
    m[6][3]=6
    m[6][4]=10
    m[6][5]=15
    m[6][6]=22
    m[6][7]=77
    m[6][8]=188
    m[6][9]=329
    m[6][10]=520
    m[6][11]=863
    m[6][12]=1297
    m[6][13]=2074
    m[6][14]=2942
    m[6][15]=4383
    m[6][16]=12050
    m[6][17]=19827
    m[6][18]=41849
    m[6][19]=81742
    m[6][20]=156389
    m[6][21]=325250
    m[6][22]=1134058
    m[6][23]=2043967
    m[6][24]=3911648
    m[6][25]=7009551
    m[6][26]=11241875
    m[6][27]=15507499
    m[6][28]=19806423
    m[6][29]=24322577
    m[6][30]=28888231
    m[7][1]=1
    m[7][2]=3
    m[7][3]=6
    m[7][4]=10
    m[7][5]=15
    m[7][6]=21
    m[7][7]=29
    m[7][8]=150
    m[7][9]=321
    m[7][10]=563
    m[7][11]=855
    m[7][12]=17416
    m[7][13]=83072
    m[7][14]=2220384
    m[7][15]=6822448
    m[7][16]=13420404
    m[7][17]=20379000
    m[7][18]=29849749
    m[7][19]=91104965
    m[7][20]=321578997
    m[7][21]=788407661
    m[7][22]=1273902245
    m[7][23]=1912731081
    m[7][24]=2570225837
    m[7][25]=3428700695
    m[7][26]=29128200347
    m[7][27]=69258903451
    m[7][28]=115121130305
    m[7][29]=176576075721
    m[7][30]=241030621167
    m[8][1]=1
    m[8][2]=3
    m[8][3]=6
    m[8][4]=10
    m[8][5]=15
    m[8][6]=21
    m[8][7]=28
    m[8][8]=37
    m[8][9]=158
    m[8][10]=450
    m[8][11]=783
    m[8][12]=1156
    m[8][13]=1570
    m[8][14]=2155
    m[8][15]=5818
    m[8][16]=14596
    m[8][17]=27727
    m[8][18]=41058
    m[8][19]=67520
    m[8][20]=94182
    m[8][21]=124285
    m[8][22]=154588
    m[8][23]=362290
    m[8][24]=991116
    m[8][25]=1651182
    m[8][26]=3148123
    m[8][27]=5083514
    m[8][28]=7054305
    m[8][29]=11253219
    m[8][30]=66619574
    m[9][1]=1
    m[9][2]=3
    m[9][3]=6
    m[9][4]=10
    m[9][5]=15
    m[9][6]=21
    m[9][7]=28
    m[9][8]=36
    m[9][9]=227
    m[9][10]=509
    m[9][11]=882
    m[9][12]=1346
    m[9][13]=1901
    m[9][14]=2547
    m[9][15]=3203
    m[9][16]=10089
    m[9][17]=35841
    m[9][18]=63313
    m[9][19]=105637
    m[9][20]=156242
    m[9][21]=782868
    m[9][22]=2323319
    m[9][23]=4036490
    m[9][24]=5757761
    m[9][25]=7586042
    m[9][26]=9463823
    m[9][27]=11349704
    m[9][28]=13750746
    m[9][29]=16185088
    m[9][30]=18627530
    return m[k][n]
    result = 0
    v10, v10s, vk, vks = 1, [1], 1, [1]
    while n > 0
        if v10 == vk
            n -= 1
            result += v10
            v10, v10s = helper(10, v10s)
            vk, vks = helper(k, vks)
        elsif v10 < vk
            v10, v10s = helper(10, v10s)
        elsif v10 > vk
            vk, vks = helper(k, vks)
        end
    end
    return result
end

def helper(k, s)
    # _s = cur.to_s(k).reverse
    # s = []
    # (0.._s.length-1).each{
    #     |i|
    #     s[i] = _s[i].to_i
    # }
    if s.length & 0b1 == 0
        # 偶长度
        i, j = s.length / 2 - 1, s.length / 2
        d = 0
        needExpend = true
        while i - d >= 0
            if s[i - d] + 1 >= k
                s[i - d] = 0
                s[j + d] = 0
                d += 1
            else
                s[i - d] += 1
                s[j + d] += 1
                needExpend = false
                break
            end
        end
        if needExpend
            s = s + [1]
            s[0] = 1
        end
    else
        # 奇长度
        i = s.length / 2
        d = 0
        needExpend = true
        while i + d < s.length
            if s[i + d] + 1 >= k
                s[i + d] = 0
                s[i - d] = 0
                d += 1
            else
                if d == 0
                    s[i + d] += 1
                else
                    s[i + d] += 1
                    s[i - d] += 1
                end
                needExpend = false
                break
            end
        end
        if needExpend
            s = s + [1]
            s[0] = 1
        end
    end
    base = 1
    result = 0
    s.each{
        |v|
        result += v * base
        base *= k
    }
    return result, s
end

if __FILE__ == $0
    # puts "#{helper(10, 65556)}"
    # puts "#{helper(7, 16561).to_s(7)}"
    # v = 1
    # while v < 65656
    #     v = helper(7, v)
    #     puts "#{v}, #{v.to_s(7)}"
    # end
    (2..9).each{
        |k|
        (1..30).each{
            |n|
            puts "m[#{k}][#{n}]=#{k_mirror(k,n)}"
        }
    }
    # puts "#{k_mirror(7,30)}"
end