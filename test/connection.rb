require 'OwnCampCommunication'

describe OwnCampCommunication::Connection, '#connect' do
  it 'Start a new connection' do
    comm = OwnCampCommunication::Connection.new('192.168.1.50', 'GeK92P0i9cms9SHj2qg1IxVqbTZ66B2LoNVplVWv')
    comm.open
    comm.status?.should eq 'LOGGED_IN'
  end
end
