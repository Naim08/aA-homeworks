# == Schema Information
#
# Table name: routes
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id,
    dependent: :destroy

  def n_plus_one_drivers
    all_drivers = {}
    buses.each do |bus|
      drivers = bus.drivers.map(&:name)
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # Your code here
    buses = self
      .buses
      .select('buses.*, COUNT(*) AS driver_count')
      .joins(:drivers)
      .group('buses.id')

    driver_counts = {}
    buses.each do |bus|
      drivers = bus.drivers.map(&:name)
      driver_counts[bus.id] = drivers
    end

    driver_counts
  end
end
