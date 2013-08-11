class MemoFolder < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 150 }
end