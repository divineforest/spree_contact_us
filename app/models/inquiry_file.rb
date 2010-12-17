class InquiryFile < Asset
  has_attached_file :attachment,
    :url => "/assets/inquiry_files/:id/:basename.:extension",
    :path => ":rails_root/public/assets/inquiry_files/:id/:basename.:extension"
end
