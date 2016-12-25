class ChangeVoteColumnValueToVote < ActiveRecord::Migration
  def change
    rename_column :votes, :value, :vote
  end
end
