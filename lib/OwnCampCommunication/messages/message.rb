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
  class Message
    HEADER_SIZE = 6 #4 bytes length, 2 bytes opcode

    attr_reader :buf

    def initialize(op)
      @opcode = op
      @buf = ByteBuffer.new
      @buf.put_int(0) #We'll change the length later
      @buf.put_short(op)
    end

    def put_short(i)
      @buf.put_short(i)
      update_length
    end

    def put_int(i)
      @buf.put_int(i)
      update_length
    end

    def put_double(i)
      @buf.put_double(i)
      update_length
    end

    def put_long(i)
      @buf.put_long(i)
      update_length
    end

    def put_cstring(val)
      @buf.put_cstring(val)
      update_length
    end

    def to_s
      @buf.to_s
    end

    def update_length
      buf_pos = @buf.position
      @buf.put_int(@buf.size-6, 0)
      @buf.position = buf_pos
    end
  end
end
