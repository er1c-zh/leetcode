#
# @lc app=leetcode.cn id=165 lang=ruby
#
# [165] 比较版本号
#

# @lc code=start
# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  v1 = version1.split ".", -1
  v2 = version2.split ".", -1
  for v in [v1, v2]
    i = 0
    while i < v.length
      v[i] = trip v[i]
      i += 1
    end
  end
  i = 0
  while i < v1.length || i < v2.length
    vv1 = "0"
    vv2 = "0"
    if i < v1.length && v1[i] != ""
      vv1 = v1[i]
    end
    if i < v2.length && v2[i] != ""
      vv2 = v2[i]
    end
    if vv1.length > vv2.length
      return 1
    elsif vv1.length < vv2.length
      return -1
    elsif vv1 == vv2
      i += 1
      next
    else
      return vv1 > vv2 ? 1 : -1
    end
  end
  return 0
end

def trip(str)
  idxPre = 0
  while idxPre < str.length
    if str[idxPre] != "0" then break end
    idxPre += 1
  end
  return str.slice idxPre, str.length
end

# @lc code=end
