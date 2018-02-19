class Trip < ApplicationRecord
  belongs_to :condition

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
                        :end_date,
                        :end_station_name,
                        :end_station_id,
                        :bike_id,
                        :subscription_type

  scope :sort_by_duration, -> { order(duration: :asc) }

  def self.average_duration
    average(:duration)
  end
end
