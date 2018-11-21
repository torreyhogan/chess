ss = "♖"
puts ss.encoding.name
ss.encode!("GB18030")
puts ss.encoding.name
p ss.encode("utf-8")
puts "♖"
