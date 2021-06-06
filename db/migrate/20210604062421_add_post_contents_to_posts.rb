class AddPostContentsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :price, :integer
    add_column :posts, :location, :string
  end
end
