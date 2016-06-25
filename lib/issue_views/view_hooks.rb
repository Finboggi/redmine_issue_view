module IssueViews
  class ViewHooks < Redmine::Hook::ViewListener
    render_on(:view_issues_show_details_bottom, partial: 'issue_view_hooks/issues/show')
  end
end
