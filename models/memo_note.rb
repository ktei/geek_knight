class MemoNote < ActiveRecord::Base
  belongs_to :memo_folder
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 2000 }
end