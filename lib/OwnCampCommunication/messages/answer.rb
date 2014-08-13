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
  #Custom exception, used when the answer received is not the one we wanted
  class WrongOpcodeError < StandardError
  end

  class Answer
    attr_accessor :length, :opcode

    def initialize(socket)
      @length = socket.read(4).unpack('N')
      @opcode = socket.read(2).unpack('n')
      content = []

      socket.read(@length[0]).each_byte do |c| #Reading every bytes and adding them in an array
        content << c
      end

      @message = ByteBuffer.new(content) #Create a bytebuffer from this array
    end
  end
end