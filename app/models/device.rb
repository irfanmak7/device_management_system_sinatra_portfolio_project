class Device < ActiveRecord::Base
    belongs_to :user
    validates :name, :serial_number,:color, presence: true
end