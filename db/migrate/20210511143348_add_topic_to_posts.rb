class AddTopicToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :topic, :string
  end
end
