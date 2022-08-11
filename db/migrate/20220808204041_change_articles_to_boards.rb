class ChangeArticlesToBoards < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles, :boards
  end
end
