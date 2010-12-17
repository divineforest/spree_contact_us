class Inquiry < ActiveRecord::Base

  has_one :inquiry_file, :as => :viewable, :dependent => :destroy

  accepts_nested_attributes_for :inquiry_file, :reject_if => lambda { |f| f[:attachment].blank? }

  validates_presence_of :email
  validates_presence_of :message

  after_save :deliver_notification_email


  def deliver_notification_email
    InquiryMailer.deliver_notification(self)
    # For delayed_job
    # InquiryMailer.send_later(:deliver_notification, self)
  end


end
