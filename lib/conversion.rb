class Conversion

  def input
    File.open('input.txt','r').each_line.to_a
  end

  def process
    other_currency = []
    input.each do |inp|
      arr = inp.gsub("\n", "").split(" is ")
      num_val = Roman.new(arr[1]).to_i
      num_val == "Invalid" ? other_currency << arr : instance_variable_set("@#{arr[0]}", arr[1] )
    end

    other_currency.each do |x|
      str = rem_curr = ""
      x[0].split(" ").collect{ |key|  var = instance_variable_get("@#{key}")
       var ? str += var : rem_curr << key }
      instance_variable_set("@#{rem_curr}", x[1].to_f/Roman.new(str).to_i)
    end
  end

  def calculate(q)
    begin
      roman_curr, sub_tot = "", 1.00
      data = q.gsub("?","").split(" is ")
      data[1].split(" ").each do |x|
        var = instance_variable_get("@#{x}")
        var.is_a?(String) ? roman_curr += var : sub_tot *= var
      end
      "#{data[1]}is #{Roman.new(roman_curr).to_i * sub_tot}"
    rescue
      "I have no idea what you are talking about"
    end
  end
end
