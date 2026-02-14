class AnnouncementMailer < ApplicationMailer
    default from: 'no-reply@afrotc.com'
  
    def new_announcement(reservist, announcement)
      @reservist = reservist
      @announcement = announcement
  
      mail(
        to: @reservist[:email],
        subject: "New Announcement: #{announcement.name}"
      )
    end
  end
  