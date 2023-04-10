class Activity < ApplicationRecord
    validates :title, :description, :start_time, :end_time, :date,  presence: true
    validate :start_time_must_be_before_end_time

    def start_time_must_be_before_end_time
        if start_time.present? && end_time.present? && start_time >= end_time
            errors.add(:horario_inicio, "deve ser menor que o horário de fim")
        end
    end
end
