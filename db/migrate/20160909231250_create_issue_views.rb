class CreateIssueViews < ActiveRecord::Migration
  def change
    create_table :issue_views do |t|
      t.references :user, index: true
      t.references :issue, index: true

      t.datetime :created_on, :updated_on

      t.index [:user_id, :issue_id]
    end
  end
end
