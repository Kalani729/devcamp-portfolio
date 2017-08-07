class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minumum: 5, maximum: 1000 }

  adter_create_commit { CommentBroadcastJob.perform_later(self) }
end
