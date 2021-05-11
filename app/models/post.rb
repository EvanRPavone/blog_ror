class Post < ApplicationRecord
    has_rich_text :body
    belongs_to :user
    acts_as_punchable
    has_many :comments, dependent: :destroy

    TOPICS=["Ruby on Rails", "JavaScript", "React", "Technology", "General", "Jobs"]
end
