# frozen_string_literal: true

json.extract! employment, :id, :employer, :date_started, :date_employment_ended, :employee_id, :created_at, :updated_at
json.url employment_url(employment, format: :json)
