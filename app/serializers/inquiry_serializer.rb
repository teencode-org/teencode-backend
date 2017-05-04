class InquirySerializer < ActiveModel::Serializer
  attributes :id, :name, :message, :phone_number, :email
end
