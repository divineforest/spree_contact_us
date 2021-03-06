class InquiryMailer < ActionMailer::Base

  default_url_options[:host] = Spree::Config[:site_url]
  self.default :from => Spree::Config[:mails_from],
               :bcc => Spree::ContactUs::Config[:contact_form_bcc]

  def notification(inquiry, resend=false)
    subject "#{Spree::Config[:site_name]} : #{I18n.t(:contact_form)}"
    body :inquiry => inquiry
    recipients Spree::ContactUs::Config[:contact_form_to]
    bcc Spree::ContactUs::Config[:contact_form_bcc]
    from inquiry.email
    content_type "text/html"
  end

end
