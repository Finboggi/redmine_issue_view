class IssueView < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  default_scope { order('created_at DESC') }

  unloadable
end
