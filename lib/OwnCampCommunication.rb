require 'OwnCampCommunication/version'
require 'socket'


module OwnCampCommunication
  class OwnCampConnection
    def initialize(address, key)
      @address = address
      @key = key
    end

    def open
      @socket = TCPSocket.new @address, 16121
    end

    def close
      @socket.close
    end
  end
end
