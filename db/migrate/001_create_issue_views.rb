class CreateIssueViews < ActiveRecord::Migration
  def change
    create_table :issue_views do |t|
      t.references :user, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
