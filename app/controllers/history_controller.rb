class HistoryController < ApplicationController
  def index
    @histories = [
      OpenStruct.new(
        user: "admin@gmail.com",
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
        user: "admin@gmail.com",
        action: "update",
        record_type: "Reservist",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/reservists/8d52eacc-1ce1-49f6-b8e8-6b71b43ae139",
        changes: "Deactivated Reservist",
        timestamp: Time.now
      ),
      OpenStruct.new(
        user: "admin@gmail.com",
        action: "create",
        record_type: "Emergency Notification",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/announcemnts/7b1533f4-67c1-4dbb-a968-2eac4efe461a",
        changes: "Created Emergency Notification: Training Schedule",
        timestamp: Time.now - 3.hours
      ),
      OpenStruct.new(
        user: "admin@gmail.com",
        action: "download",
        record_type: "ADT",
        record_id: "https://afrotc-vault-58e61a936423.herokuapp.com/announcemnts/7b1533f4-67c1-4dbb-a968-2eac4efe461a",
        changes: "Downloaded ADT Report: Training Schedule",
        timestamp: Time.now - 3.hours
      )
    ]
  end
end
