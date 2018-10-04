require "docking_station"
require "bike"
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to(:release_bike)
  end
  
  it 'release working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end
  
  it 'respond to bike' do
    expect(subject).to respond_to(:bikes)
  end
  
  it 'responds to docking' do
    expect(subject).to respond_to(:dock).with(1).argument
    #'it { is_expected.to respond_to(:dock).with(1).argument } <= One line test
  end
  
  it 'docking station responds back with bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
  
  it 'Checking if bike is in docking station' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end
  
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  describe '#release_bike' do
    it 'release a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when no bike are avaible at the station' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  describe '#dock' do
  it 'raise an error when docking a bike when station is full' do
    subject.capacity.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error 'Docking Station Full!'
  end
  end
  describe 'initialize' do
    
    subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking Station Full!'
  end
  
  it 'has a variable capacity' do
    station = DockingStation.new(50)
    50.times { station.dock Bike.new }
    expect{ station.dock Bike.new }.to raise_error 'Docking Station Full!'
  end
end
end