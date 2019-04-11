class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, allow_blank: false

  after_create :broadcast_message


  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("post_#{post.id}", {
      comment_partial: ApplicationController.renderer.render(partial: "comments/comment", locals: { comment: self, user_is_comments_author: false }
        ),
      current_user_id: user.id
    })
  end
end
