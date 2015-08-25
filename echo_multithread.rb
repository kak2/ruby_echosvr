require 'socket'

server = TCPServer.new 2000
loop do
  Thread.start(server.accept) do |client|
    loop do
      msg = client.gets.chomp
      if msg == "quit"
        client.close
        Thread.exit
      else
        client.puts msg
      end
    end
  end
end