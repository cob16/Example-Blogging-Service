# creates a model to store timeline posts into
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.timestamps null: false
    end
  end
end
