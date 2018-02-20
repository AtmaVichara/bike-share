class Station < ApplicationRecord
  validates_presence_of :name,
                        :lat,
                        :long,
                        :dock_count,
                        :city,
                        :installation_date
  has_many :statuses
  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize if name
  end

  def self.total_count_of_stations
    count
  end

  def self.average_bikes_available_per_station
    average("dock_count").floor
  end

  def self.most_bikes_available_per_station 
    group(:name).order("dock_count ASC")
  end

  # def self.stations_with_most_bikes_available
  #   group("name")where(max("dock_count"))
  # end

end
