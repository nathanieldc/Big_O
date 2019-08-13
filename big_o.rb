require "byebug"

def idea(list)
    list.each_with_index do |ele, idx|                  #n
        return ele if list.all? { |ele2| ele <= ele2}   #n
    end
end

def my_min(list)
    return list[0] if list.length <= 1
    first_num = list.shift                              #n
    least_val = first_num
    list.each { |ele| least_val = ele if ele < least_val} #n
    least_val
end

def largest_contiguous_subsum(list)
    arr = []
    list.each_with_index do |ele_1, idx_1|
        list.each_with_index do |ele_2, idx_2|
            arr << list[idx_1..idx_2] if idx_1 <= idx_2
        end
    end
    arr.map!{|ele|ele.sum}.flatten.sort[-1]
end

def largest_contiguous_subsum(list)
    # debugger
    lsum = list[0]
    gsum = list.max
    list.each_with_index do |ele2, idx2|
        if ele2 + lsum > 0
            lsum += ele2
        elsif ele2 > ele2 + lsum
            lsum = ele2
        end
        gsum = lsum if lsum > gsum
    end
    gsum
end

list2 = [-5, -1, -3]
list3 = [-5, -1, -3, 4]

def first_anagram?(str_1, str_2)
    arr_1 = str_1.split('')
    perm_1 = arr_1.permutation.to_a
    perm_1.map! {|ele| ele.join('')}
    perm_1.flatten.include?(str_2)
end
# a lot
second_anagram?("deductions", "discounted")

def second_anagram?(str1, str2)
    arr2 = str2.split("")
    str1.each_char do |char|
        if str2.index(char) == nil
            return false
        else
            i = arr2.index(char)
            arr2.delete_at(i)
        end
    end
    arr2.empty?
end