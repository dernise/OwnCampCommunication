# OwncampCommunication is a gem that let you communicate with a OwnCamp server
# Copyright (C) 2014 <Maxence Henneronr>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module OwnCampCommunication
  class Connection
    def initialize(address, key)
      @address = address
      @key = key
      @status = 'NULL'
    end

    def open
      begin
        @socket = TCPSocket.new @address, 16121
        send_auth_message
      rescue Errno::ECONNREFUSED
        @status = 'UNREACHABLE'
        return
      end
    end

    def send_auth_message
      connect_message = ConnectMessage.new
      @socket.puts connect_message.to_s
      @status = 'CONNECTED'
    end

    def close
      @socket.close
    end

    def status?
      @status
    end
  end
end