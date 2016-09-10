# adding before_action with issue_view model save to IssueController
# TODO: rewrite class comment
require_dependency "issues_controller"
module IssueViews
  module IssuesControllerPatch
    def self.included(base)
      base.class_eval do
        before_action :save_issue_view, only: [:show, :update], if: :issue_view_update?
        before_action :retrieve_involved_users_view, only: :show

        private

        def save_issue_view
          if IssueViewService.record_only_last?
            IssueView.find_or_create_by!(issue: @issue, user: User.current).touch
          else
            IssueView.create(issue: @issue, user: User.current)
          end
        end

        def retrieve_involved_users_view
          @issue_views = {}

          IssueViewService.involved_users(@issue).each do |u|
            @issue_views[u.id] = IssueView.where( { issue: @issue, user: u } ).first unless u.nil?
          end
        end

        def issue_view_update?
          (IssueViewService.user_type == 'all') ? true : User.current.in?(IssueViewService.involved_users(@issue))
        end
      end
    end
  end
end
