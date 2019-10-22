class Admin::PagesController < ApplicationController
  def portal
    authorize [:admin, current_user]
  end

  def categories
    @category = Category.new
    @categories = Category.all
    @sub_category = SubCategory.new
    @sub_categories = SubCategory.all
    authorize [:admin, current_user]
  end

  def sales_report
    authorize [:admin, current_user]
    @orders = Order.all
    if params[:filter] && filter_params[:from].present?
      from  = Date.parse(filter_params[:from]).beginning_of_day
      to = Date.parse(filter_params[:to]).end_of_day
      @orders = @orders.where(created_at: from..to)
    end
    if params[:filter] && filter_params[:influencer_id].present?
      id = filter_params[:influencer_id]
      @orders = @orders.joins("LEFT JOIN tutorials ON orders.affiliation_type = 'Tutorial' AND
                                            orders.affiliation_id = tutorials.id").
                        joins("LEFT JOIN lookbooks ON orders.affiliation_type = 'Lookbook' AND
                                             orders.affiliation_id = lookbooks.id").
                        where('tutorials.user_id = ? OR lookbooks.user_id = ?', id, id)
    end
  end

  def activity_report
    authorize [:admin, current_user]
    lookbooks = Lookbook.where(status: 'approved')
    tutorials = Tutorial.where(status: 'approved')
    if params[:filter] && filter_params[:from].present?
      from  = Date.parse(filter_params[:from]).beginning_of_day
      to = Date.parse(filter_params[:to]).end_of_day
      lookbooks = lookbooks.where(publish_date: from..to)
      tutorials = tutorials.where(publish_date: from..to)
    end
    if params[:filter] && filter_params[:influencer_id].present?
      id = filter_params[:influencer_id]
      lookbooks = lookbooks.where(user_id: id)
      tutorials = tutorials.where(user_id: id)
    end
    @results = (lookbooks + tutorials).sort { |model| -model.publish_date.to_i }
  end

  private

  def filter_params
    params.require(:filter).permit(:from, :to, :influencer_id)
  end
end
