class RenameTitleColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :title, :name
  end
end
