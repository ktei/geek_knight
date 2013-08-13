class MemoFolder < ActiveRecord::Base
  has_many :memo_notes, :dependent => :destroy

  validates :name, presence: true, length: { maximum: 50 }
end