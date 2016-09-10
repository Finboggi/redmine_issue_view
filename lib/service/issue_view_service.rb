class IssueViewService

  USER_TYPES = %w(all base plus_watchers)

  def initialize
  end

  def self.record_only_last?
    Setting.plugin_issue_view.is_a?(Hash) && Setting.plugin_issue_view.key?(:record_only_last)
  end

  def self.user_type
    user_type_setting = 'base'
    if Setting.plugin_issue_view.is_a?(Hash) && Setting.plugin_issue_view.key?(:user_type)
      user_type_setting = Setting.plugin_issue_view[:user_type]
    end

    user_type_setting
  end

  def self.involved_users(issue)
    users = base_recorded_users(issue)

    unless user_type == 'base'
      users = users +
        User.joins("INNER JOIN watchers ON watchers.user_id = users.id
                INNER JOIN issues ON issues.id = watchers.watchable_id AND watchers.watchable_type = 'Issue'").where("issues.id = #{issue.id}")
    end

    users
  end

  def self.base_recorded_users(issue)
    [issue.author, issue.assigned_to]
  end
end
