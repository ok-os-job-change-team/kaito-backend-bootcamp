require 'socket'

server = TCPServer.new('0.0.0.0', 3000)
loop do
  socket = server.accept
  Thread.start(socket) do |s|
    request = s.gets # HTTPリクエストの読み取り
    response = "Hello, World!!!"
    s.print "HTTP/1.1 200 OK\r\n" +
            "Content-Type: text/plain\r\n" +
            "Content-Length: #{response.bytesize}\r\n" +
            "Connection: close\r\n" +
            "\r\n"
    s.print response
    s.close
  end
end
