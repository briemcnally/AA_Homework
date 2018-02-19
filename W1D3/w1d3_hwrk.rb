def sum_to(n)
  return nil if n < 0
  return 1 if n == 1
  sum_to(n - 1) + n
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr.pop + add_numbers(arr)
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  gamma_fnc(n - 1) * (n - 1)
end

def ice_cream_shop(arr, fav)
  return false if arr.empty?
  return true if arr.first == fav

  ice_cream_shop(arr[1..-1], fav)
end

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end
