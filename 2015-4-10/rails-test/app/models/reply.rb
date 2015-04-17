class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: Post, default: ""

  belongs_to :post
  validates_presence_of :post

  after_create do
    post.inc(replies_count: 1)
  end

  after_destroy do
    post.inc(replies_count: -1)
  end
end
