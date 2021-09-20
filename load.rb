require 'net/http'
require 'json'

def sort array
    ret = []
    array.each {|n1|
        if ret.empty?
            ret.push n1
        else 
            n = false
            ret.each{|n2|
                if n1 < n2
                    n2_index = ret.index n2
                    ret.insert(n2_index, n1)
                    n = true
                    break
                end
            }
            next if n
            ret.push n1
        end
    }
    ret
end

def request n
    res = ""
    loop do
        puts "n = " + n.to_s
        url = URI.parse('http://challenge.dienekes.com.br/api/numbers?page=' + n.to_s)
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        res = JSON.parse res.body
        break if res["error"].nil?
    end 

    puts res
    puts n
    return res
end

n = 1
tot = []
while true
    numbers = request n

    while numbers['error'] == "Simulated internal error"
        sleep 5
        numbers = request n

    end 

    if numbers['numbers'].empty? || n == 10 
        puts "Acabou; n = " + n.to_s
        break
    else
        numbers = numbers['numbers']
        tot = tot + numbers
        n = n + 1
        puts tot
    end
end

tot = sort tot

puts "Antes do insert"
puts tot

x = 1
tot.each {|n|
    puts "Inserindo o registro: " + x.to_s
    register = Num.new
    register.number = n
    register.save
    x = x + 1
}

puts "Depois do insert"

puts Num.all
puts "###################"
puts "Acabou"

