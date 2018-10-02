require "docking_station"
require "bike"
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to(:release_bike)
  end
  
  it 'release working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  
  it 'respond to bike' do
    is_expected.to respond_to(:bike)
  end
  
  it 'responds to docking bike' do
    is_expected.to respond_to(:dock).with(1).argument
  end
  
  it 'respond to docking a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
  end
end