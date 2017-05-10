class AddApprovalAndApproverToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :approved, :boolean
  	add_column :events, :user_id, :integer
  end
end
