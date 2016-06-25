# adding after_action with issue_view model save to IssueController

require_dependency "issues_controller"
module IssueViews
  module IssuesControllerPatch
    def self.included(base)
      base.class_eval do
        before_action :save_issue_view, only: [:show, :update]
        before_action :retrieve_involved_users_view, only: :show

        private

        def save_issue_view
          IssueView.create({issue: @issue, user: User.current})
        end

        def retrieve_involved_users_view
          @issue_views = {}
          involved_users = [@issue.author, @issue.assigned_to]

          involved_users.each do |u|
            @issue_views[u.id] = IssueView.where( { issue: @issue, user: u } ).first unless u.nil?
          end
        end
      end
    end
  end
end
