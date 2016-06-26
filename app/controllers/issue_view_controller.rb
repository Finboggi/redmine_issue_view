class IssueViewController < ApplicationController
  before_action :find_issue
  unloadable

  def index
    @issue_views = IssueView.where issue_id: @issue.id
    respond_to do |format|
      format.html { render layout: !request.xhr? }
      format.json { render json: { issue_views: @issue_views } }
    end
  end

  private

  def find_issue
    @issue = Issue.find params[:issue_id]
  end
end
