require 'OwnCampCommunication'

describe OwnCampCommunication::Connection, '#connect' do
  it 'Start a new connection' do
    comm = OwnCampCommunication::Connection.new('192.168.1.50', 1234)
    comm.open
    comm.status?.should eq 'CONNECTED'
  end
end
