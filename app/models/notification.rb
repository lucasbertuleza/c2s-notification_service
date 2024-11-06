class Notification < ApplicationRecord
  belongs_to :task
  before_create { |record| record.data = {} if record.data.nil? }
end
