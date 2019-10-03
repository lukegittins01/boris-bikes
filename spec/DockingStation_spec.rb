require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
  describe '#releases_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

    # existing tests omitted for brevity
    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
    end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe "#release_bike" do
      it 'does not allow release of broken bike' do
      docking_station = DockingStation.new(30)
      bike = Bike.new
      bike.report_broken
      docking_station.dock(bike)
      expect{subject.release_bike}.to raise_error{"bike is broken"}
  end
  end

  it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock bike
      expect(subject.release_bike).to be bike
   end
end
