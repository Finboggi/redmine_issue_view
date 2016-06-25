Rails.logger.info 'Starting Issue view plugin for RedMine'

Redmine::Plugin.register :issue_view do
  name 'Issue view plugin'
  author 'Kosivchenko Mikhail'
  description 'This is a plugin for Redmine to journalize events of users view changed issue.
    Might be helpful to understand if involved users have seen my comments in issue or not.'
  version '0.0.1'
end
