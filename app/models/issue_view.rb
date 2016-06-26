class IssueView < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  default_scope { order('created_at DESC') }

  unloadable

  def humanized_list(issue_id)
    issue_views = IssueView.where issue_id: @issue.id
    user_ids = issue_views.map(&:user_id).uniq
  end
end
