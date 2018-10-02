require 'bike'

describe Bike do
    it "Responds to bike working?" do
    expect(subject).to respond_to(:working?)
end
end