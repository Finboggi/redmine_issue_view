class IssueView < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  # destroy all but last updated for each pair issue and user
  def self.wipe_all_multiple!
    IssueView.distinct.select(:issue_id, :user_id).each do |i|
      params = { issue_id: i.issue_id, user_id: i.user_id }
      last_issue_view_id = IssueView.where(params).order(:updated_on).last.id

      IssueView.where(params).where.not(id: last_issue_view_id).destroy_all
    end
  end
end
