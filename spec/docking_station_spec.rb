require "docking_station"
require "bike"
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to(:release_bike)
  end
  
  it 'release working bikes' do
    bike = subject.release_bike #release_bike is a method
    expect(bike).to be_working #"be_" is boolean in this case be_(method) returns true for bike is working
  end
  
  it 'respond to bike' do
    expect(subject).to respond_to(:bike)
  end
  
  it 'responds to docking' do
    expect(subject).to respond_to(:dock).with(1).argument
    #'it { is_expected.to respond_to(:dock).with(1).argument } <= One line test
  end
  
  it 'docking station responds back with bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
  
  it 'Checking if bike is in docking station' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end