class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :post
      t.references :user
      t.references :comment
      t.timestamps
    end
  end
end
