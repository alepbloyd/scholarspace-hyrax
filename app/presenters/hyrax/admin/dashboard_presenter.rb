# frozen_string_literal: true
module Hyrax
    module Admin
      class DashboardPresenter
        # @return [Fixnum] the number of currently registered users
        def user_count(start_date, end_date)
          ::User.where(guest: false)
                .where({ created_at: start_date.to_date.beginning_of_day..end_date.to_date.end_of_day })
                .count
        end

        def create_work_presenter
            # @create_work_presenter ||= create_work_presenter_class.new(current_ability.current_user)
            Hyrax::SelectTypeListPresenter.new(current_ability.current_user)
        end

        def draw_select_work_modal?
            true
        end
  
        def repository_objects
          @repository_objects ||= Admin::RepositoryObjectPresenter.new
        end
  
        def repository_growth(start_date, end_date)
          @repository_growth ||= Admin::RepositoryGrowthPresenter.new(start_date, end_date)
        end
  
        def user_activity(start_date, end_date)
          @user_activity ||= Admin::UserActivityPresenter.new(start_date, end_date)
        end
      end
    end
  end
  