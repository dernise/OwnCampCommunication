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

require 'OwnCampCommunication/messages/opcodes'
require 'OwnCampCommunication/messages/message'

module OwnCampCommunication
  class ConnectMessage < Message
    def initialize(key)
      super(Opcodes::CMSG_AUTH_MESSAGE)
      put_byte 1
      put_cstring key
    end
  end
end
