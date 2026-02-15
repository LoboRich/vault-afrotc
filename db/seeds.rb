# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end\\
User.create!(email: "admin@gmail.com", password: 'password')
require "securerandom"

RANKS = %w[Private Corporal Sergeant Lieutenant Captain Major Colonel]
BRANCHES = ["Bacolod", "Bago"]
COMPLEXIONS = %w[Fair Light Brown Dark]

FIRST_NAMES = %w[John Mark Carlo Maria Angela Kevin Joshua Daniel Miguel]
LAST_NAMES = %w[Cruz Reyes Santos Garcia Lopez Mendoza Torres Ramos]
MIDDLE_NAMES = %w[Dela Cruz Villanueva Bautista Fernandez Soriano]

def random_coordinates(city)
  case city
  when "Bacolod"
    lat = rand(10.62..10.75)
    lng = rand(122.90..123.05)
  when "Bago"
    lat = rand(10.45..10.65)
    lng = rand(122.80..122.95)
  end

  [lat.round(6), lng.round(6)]
end

puts "Seeding reservists..."

50.times do
  branch = BRANCHES.sample
  lat, lng = random_coordinates(branch)

  first_name  = FIRST_NAMES.sample
  last_name   = LAST_NAMES.sample
  middle_name = MIDDLE_NAMES.sample

  user = User.create!(
    email: "#{first_name.downcase}.#{SecureRandom.hex(3)}@example.com",
    password: "password",
    password_confirmation: "password"
  )

  Reservist.create!(
    user: user,
    id: SecureRandom.uuid,
    rank: RANKS.sample,
    last_name: last_name,
    first_name: first_name,
    middle_name: middle_name,
    city: branch,
    branch_of_service: branch,
    afpsn: SecureRandom.hex(4),
    primary_afsc: "Infantry",
    duty_afsc: "Infantry",
    other_skills: "Basic Combat",
    source_of_enlistment: "Walk-in",
    soe_authority: "AFP",
    soe_date_of_enlistment: rand(1..5).years.ago,
    soe_initial_rank: "Private",
    source_of_commission: "AFP",
    soc_authority: "AFP",
    soc_date_of_enlistment: rand(1..5).years.ago,
    soc_initial_rank: "Private",
    reservist_classification: "Ready Reserve",
    classification_authority: "AFP",
    date_of_classification: rand(1..3).years.ago,
    reserve_unit_assignment: "Unit #{rand(1..10)}",
    date_assigned: rand(1..3).years.ago,
    unit_capability: "Combat Ready",
    present_designation: "Rifleman",
    mobilization_center: branch,
    complexion: COMPLEXIONS.sample,
    identifying_marks: "None",
    height_cm: rand(150..190),
    weight_kg: rand(50..100),
    email: user.email,
    residence_tel: rand(2000..9999).to_s,
    office_tel: rand(2000..9999).to_s,
    mobile_nr: "09#{rand(100000000..999999999)}",
    tin: rand(100000..999999).to_s,
    sss_number: rand(100000..999999).to_s,
    gsis_number: rand(100000..999999).to_s,
    philhealth_number: rand(100000..999999).to_s,
    pagibig_number: rand(100000..999999).to_s,
    dialects_spoken: "Hiligaynon, Filipino",

    lat: lat,
    long: lng,

    is_active: true
  )
end

puts "Done seeding 50 reservists!"
