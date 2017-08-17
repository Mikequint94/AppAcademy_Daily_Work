def sum_to(n)
  if n==1
    1
  elsif n < 0
    nil
  elsif n==0
    0
  else
    n + sum_to(n-1)
  end
end

def add_numbers(nums_array)
  if nums_array.length == 1
    nums_array
  elsif nums_array.length > 1
    nums_array[0] += nums_array.pop
    add_numbers(nums_array)
  end
end

def gamma_fnc(n)
  if n == 1
    1
  elsif n > 1
    (n-1) * gamma_fnc(n-1)
  end
end

def ice_cream_shop(flavors, favorite)
  if flavors[-1] == favorite
    return true
  elsif flavors.length > 0
    ice_cream_shop(flavors[0...-1], favorite)
  else
    return false
  end
end

def reverse(string)
  return str if string.length <= 1
  string[-1] + reverse(string[0...-1])
end
