#
# @lc app=leetcode.cn id=690 lang=ruby
#
# [690] 员工的重要性
#

# @lc code=start
=begin
# Definition for Employee.
class Employee
    attr_accessor :id, :importance, :subordinates
    def initialize( id, importance, subordinates)
        @id = id
        @importance = importance
        @subordinates = subordinates
    end
end
=end

# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
    n = employees.size
    idx = Hash.new{-1}
    for i in 0...n
        idx[employees[i].id] = i
    end
    q = [id]
    result = 0
    while q.size > 0
        nq = []
        q.each{
            |i|
            e = employees[idx[i]]
            nq += e.subordinates
            result += e.importance
        }
        q = nq
    end
    return result
end
# @lc code=end

