class AddOwnerToEvents < ActiveRecord::Migration
  def change
    add_column :events, :owner, :string
  end
end
