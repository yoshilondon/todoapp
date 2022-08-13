class RenameContentColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :content, :description
  end
end
