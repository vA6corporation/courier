kg = 0
base_price = 25
price_1 = 36.27
price_2 = 51.69
price_3 = 120.27

result_price = 0

if kg <= 0.5
  result_price = 22.97
  puts result_price
  elsif 0.5 < kg && kg <= 1
    result_price = base_price 
    puts result_price
    elsif 1 < kg && kg <=2
      result_price = base_price + (5.85*(kg-1))
      puts result_price
      elsif 3 <= kg && kg < 6
        result_price = price_1 + (kg-3)*5.42
        puts result_price
        elsif 6 <= kg && kg < 21
          result_price = price_2 + (kg-6)*4.59
          puts result_price
          elsif 21 <= kg && kg <= 49
            result_price = price_3 + (kg-21)*4.32
            puts result_price
            else
              puts "No llevamos paquetes mayores a 49kg"
end