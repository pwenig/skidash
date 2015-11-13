module Features

  def create_mountains
    Mountain.create(:name => "Eldora",
                    :zip_code =>"80466",
                    :opening_date => "12/01/2015 8:30 AM",
                    :video_url =>"http://63.147.112.178:9595/axis-cgi/jpg/image.cgi?resolution=640x480")

    Mountain.create(:name => "Steamboat",
                    :zip_code =>"80487",
                    :opening_date => "11/26/2015 8:30 AM",
                    :video_url =>"http://manage.hdrelay.com/snapshot/4b8a8aec-33e6-4cea-b2ac-73759064b0ce?size=710x425&f=300000")

    Mountain.create(:name=> "Breckenridge",
                    :zip_code =>"80424",
                    :opening_date => "11/13/2015 8:30 AM",
                    :video_url => "http://common.snow.com/Mtncams/peak8base.jpg")

    Mountain.create(:name => "Vail",
                    :zip_code => "81657",
                    :opening_date => "11/20/2015 8:30 AM",
                    :video_url => "http://common.snow.com/Mtncams/TOVLionshead.jpg")

    Mountain.create(:name => "Copper",
                    :zip_code => "80433",
                    :opening_date => "11/11/2015 8:30 AM",
                    :video_url => "http://www.coppercolorado.com/winter/the_mountain/snow_stake_cam/campic.jpg")

    Mountain.create(:name => "Winter Park",
                    :zip_code => "80482",
                    :opening_date => "11/18/2015 8:30 AM",
                    :video_url => "http://cams.winterparkresort.com/winter-park-basecam.jpg")

  end
end