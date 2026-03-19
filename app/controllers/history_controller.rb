class HistoryController < ApplicationController
  def index
    @histories = [
      OpenStruct.new(
        user: {
          fullname: "John Voegeler",
          user_id: "user_123"
        },
        action: "update",
        record_type: "Reservist",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/reservists/8d52eacc-1ce1-49f6-b8e8-6b71b43ae139",
        changes: {
          rank: ["Private", "Sergeant"],
          unit: ["Alpha", "Bravo"]
        }.to_json,
        timestamp: Time.now
      ),
      OpenStruct.new(
        user: {
          fullname: "Louie De Palma",
          user_id: "user_123"
        },
        action: "update",
        record_type: "Reservist",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/reservists/8d52eacc-1ce1-49f6-b8e8-6b71b43ae139",
        changes: "Deactivated Reservist",
        timestamp: Time.now
      ),
      OpenStruct.new(
        user: {
          fullname: "Louie De Palma",
          user_id: "user_123"
        },
        action: "create",
        record_type: "Emergency Notification",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/announcemnts/7b1533f4-67c1-4dbb-a968-2eac4efe461a",
        changes: "Created Emergency Notification: Training Schedule",
        timestamp: Time.now - 3.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "John Voegeler",
          user_id: "user_123"
        },
        action: "download",
        record_type: "ADT",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/announcemnts/7b1533f4-67c1-4dbb-a968-2eac4efe461a",
        changes: "Downloaded ADT Application Form",
        timestamp: Time.now - 3.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Louie De Palma",
          user_id: "user_123"
        },
        action: "create",
        record_type: "Emergency Notification",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/announcemnts/7b1533f4-67c1-4dbb-a968-2eac4efe461a",
        changes: "Created Emergency Notification: Training Schedule",
        timestamp: Time.now - 16.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Louie De Palma",
          user_id: "user_123"
        },
        action: "create",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/events/736a3836-1efd-4d99-aed1-d1f382c7bcbe",
        changes: "Created Event: Basic Weapon Handling",
        timestamp: Time.now - 16.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Christian Vaughn",
          user_id: "user_178732"
        },
        action: "update",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/events/736a3836-1efd-4d99-aed1-d1f382c7bcbe",
        changes: "Uploaded Profile Image",
        timestamp: Time.now - 16.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Kathryn Janeway",
          user_id: "user_178732"
        },
        action: "update",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/events/736a3836-1efd-4d99-aed1-d1f382c7bcbe",
        changes: "Updated Account Information",
        timestamp: Time.now - 16.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Jovi Lopez",
          user_id: "user_178732"
        },
        action: "update",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/events/736a3836-1efd-4d99-aed1-d1f382c7bcbe",
        changes: "Updated Account Information",
        timestamp: Time.now - 16.hours
      ),
      OpenStruct.new(
        user: {
          fullname: "Lucy Heartfilia",
          user_id: "user_178732"
        },
        action: "create",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/events/736a3836-1efd-4d99-aed1-d1f382c7bcbe",
        changes: "Created new ADT Application",
        timestamp: Time.now - 3.hours
      )
    ]
  end
end
