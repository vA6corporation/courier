kg = 15
base_price = 38.84
price_1 = 50.36
price_2 = 66.13
price_3 = 136.13

result_price = 0

if kg <= 0.5
  result_price = 35.85
  puts result_price
  elsif 0.5 < kg && kg <= 1
    result_price = base_price 
    puts result_price
    elsif 1 < kg && kg <=2
      result_price = base_price + (5.93*(kg-1))
      puts result_price
      elsif 3 <= kg && kg < 6
        result_price = price_1 + (kg-3)*5.54
        puts result_price
        elsif 6 <= kg && kg < 21
          result_price = price_2 + (kg-6)*4.69
          puts result_price
          elsif 21 <= kg && kg <= 49
            result_price = price_3 + (kg-21)*4.49
            puts result_price
            else
              puts "No llevamos paquetes mayores a 49kg"
end