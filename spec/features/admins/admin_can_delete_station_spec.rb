require 'rails_helper'

describe "As an admin" do
  describe "they can delete a station" do
    it "they delete the station" do
      admin = create(:admin)
      station = create(:station)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit station_path(station.slug)

      expect(page).to have_content("Station Details")
      expect(page).to have_content("1 Street")
      expect(page).to have_content("City: San Francisco")
      expect(page).to have_content("1991-12-12")

      click_on "delete"

      expect(page).to have_content("Stations")
      expect(page).to have_content("1 Street was deleted")
      expect(page).to_not have_content("City: San Francisco")
      expect(page).to_not have_content("1991-12-12")
    
    end
  end
end


# As a admin,
# When I visit the stations index,
# I see everything a visitor can see,
# I see a button next to each station to edit that station,
# I also see a button next to each station to delete that station.