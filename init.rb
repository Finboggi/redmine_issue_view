# This plugin should be reloaded in development mode.
# if Rails.env == "development"
#   ActiveSupport::Dependencies.autoload_once_paths.reject!{|x| x =~ /^#{Regexp.escape(File.dirname(__FILE__))}/}
# end
# TODO: record only involved users (include watchers)
# TODO: javascript async view last comment check

IssuesController.send(:include, IssueViews::IssuesControllerPatch)

require_dependency 'issue_views/view_hooks'

Redmine::Plugin.register :issue_view do
  name 'Issue view plugin'
  author 'Kosivchenko Mikhail'
  description 'This is a plugin for Redmine to journalize events of users view changed issue.
    Might be helpful to understand if involved users have seen my comments in issue or not.'
  version '0.0.1'
  url 'https://github.com/Finboggi/redmine_issue_view'
  author_url 'https://github.com/Finboggi'
  settings default: { record_only_last: 'on' }, partial: 'settings/issue_view_plugin_settings'
end
