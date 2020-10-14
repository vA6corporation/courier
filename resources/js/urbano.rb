kg = 50
base_price = 12.5
price_1 = 23.6
price_2 = 38.77
price_3 = 105.87
result_price = 0

if kg <= 0.5
  result_price = 11.4
  puts result_price
  elsif 0.5 < kg && kg <= 1
    result_price = 12.5
    puts result_price
    elsif 1 < kg && kg <=2
      result_price = 12.50 + (5.76*(kg-1))
      puts result_price
      elsif 3 <= kg && kg < 6
        result_price = price_1 + (kg-3)*5.34
        puts result_price
        elsif 6 <= kg && kg < 21
          result_price = price_2 + (kg-6)*4.49
          puts result_price
          elsif 21 <= kg && kg <= 49
            result_price = price_3 + (kg-21)*4.24
            puts result_price
            else
              puts "No llevamos paquetes mayores a 49kg"
end