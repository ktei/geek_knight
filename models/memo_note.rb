class MemoNote < ActiveRecord::Base
  belongs_to :memo_folder
  
  validates :name, presence: true, length: { maximum: 150 }
  validates :content, presence: true, length: { maximum: 2000 }
end