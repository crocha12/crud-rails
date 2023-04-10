class Activity < ApplicationRecord
    validates :title, :description, :start_time, :end_time, :date,  presence: true
    validates :start_time, numericality: { less_than: :end_time }
end
