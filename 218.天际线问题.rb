#
# @lc app=leetcode.cn id=218 lang=ruby
#
# [218] 天际线问题
#

# @lc code=start
# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  buildings.sort! {
    |x, y|
    if x[0] == y[0]
      y[2] <=> x[2]
    else
      x[0] <=> y[0]
    end
  }

  result = Array.new(0) { Array.new(2) { 0 } }
  i = 0
  heap = EHeap.new
  while true
    inH = heap.peek
    outH = buildings[i]

    if inH == nil && outH == nil
      # end
      break
    end

    if inH == nil
      # 第一次遇到一个建筑
      # 推进去 建一个点
      result = result.append([outH[0], outH[2]])
      heap.push(outH)
      i += 1
      next
    end

    if outH == nil || inH[1] < outH[0]
      # 堆外的建筑没有关联
      # 如果这里peek出来的也是结束了的 是无效的
      while heap.peek != nil && heap.peek[1] <= inH[1]
        heap.pop
      end
      cur = heap.peek
      if cur == nil
        result = result.append([inH[1], 0])
      elsif cur[2] != inH[2]
        result = result.append([inH[1], cur[2]])
      end
      next
    elsif inH[1] == outH[0]
      while heap.peek != nil && heap.peek[1] <= inH[1]
        heap.pop
      end
      heap.push outH
      cur = heap.peek
      if cur[2] != inH[2]
        result = result.append([inH[1], cur[2]])
      end
      i += 1
    else
      heap.push outH
      if inH[2] < outH[2]
        result = result.append([outH[0], outH[2]])
      end
      i += 1
    end
  end

  return result
end

class EHeap
  attr_accessor :h, :cnt

  def initialize
    @h = []
    @cnt = 0
  end

  def peek
    if @cnt == 0
      return nil
    end
    return @h[0]
  end

  def pop
    _r = @h[0]
    @h[0] = @h[@cnt - 1]
    @cnt -= 1
    i = 0
    while i * 2 + 1 < @cnt
      l = 2 * i + 1
      r = 2 * i + 2
      t = l
      if r < @cnt && @h[r][2] > @h[l][2]
        t = r
      end
      if @h[i][2] >= @h[t][2]
        break
      end
      tmp = @h[i]
      @h[i] = @h[t]
      @h[t] = tmp
      i = t
    end
    return _r
  end

  def push(ele)
    @h[@cnt] = ele

    idx = @cnt
    while idx > 0
      if @h[idx / 2][2] < @h[idx][2]
        tmp = @h[idx]
        @h[idx] = @h[idx / 2]
        @h[idx / 2] = tmp
        idx = idx / 2
      else
        break
      end
    end
    @cnt += 1
  end
end

# @lc code=end

if __FILE__ == $0
  h = EHeap.new
  h.push [0, 1, 1]
  p "#{h.h}"
  h.push [0, 1, 7]
  p "#{h.h}"
  h.push [0, 1, 4]
  p "#{h.h}"
  h.push [0, 1, 9]
  p "#{h.h}"
  h.push [0, 1, 2]
  p "#{h.h}"

  while h.peek != nil
    p "pop: #{h.pop}"
    p "==#{h.h}"
  end
end
