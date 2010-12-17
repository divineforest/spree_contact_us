class InquiriesController < Spree::BaseController
  helper 'spree/base'
  resource_controller

  new_action.before do
    @inquiry.build_inquiry_file
  end

  create.flash I18n.t(:on_send_message)

  def index
    redirect_to(new_inquiry_url) unless params[:inquiry]
  end

end
