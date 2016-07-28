module Features
  module AppSubmitHelpers
    def fill_out_app
      Faker::Config.locale = "en-US"
      
      fill_in :first_name, with: Faker::Name.first_name
      fill_in :last_name, with: Faker::Name.last_name
      fill_in :mi, with: "A"
      fill_in :dob, with: Faker::Date.between(40.years.ago, 20.years.ago)
                            .strftime("%b %d, %Y")
      fill_in :ssn, with: Faker::Number.number(9)
      fill_in :gender, with: "Female"
      fill_in :place_of_birth, with: Faker::Address.city
      fill_in :apt, with: Faker::Address.secondary_address
      fill_in :city, with: Faker::Address.city
      fill_in :state, with: Faker::Address.state
      fill_in :zip_code, with: Faker::Address.zip
      fill_in :county, with: Faker::Address.city
      fill_in :residence_time_length, with: "#{rand(20)} years"

      fill_in :recommend_agency_type, with: Faker::Company.buzzword

      fill_in :tour_date, with: Faker::Time.backward(14).strftime("%b %d, %Y")

      select("Home of Family Member",
        from: symbol_to_underscore(:current_housing_type))
      select("With others",
        from: symbol_to_underscore(:live_alone_or_with_others))
      fill_in :who_live_with, with: "Parents"

      [:ssi, :ssdi, :wages, :family_income, :snap, :retirement_benefits,
        :veteran_benefits, :public_assistance, :other_income,
        :total_income]. each {|n| fill_in n, with: rand(200)}

      select("Permanent Partner",
        from: symbol_to_underscore(:marital_status))

      [:school_attended_1, :school_attended_2, :school_attended_3].each do |n|
        fill_in n, with: Faker::Educator.university
      end
      [:school_years_1, :school_years_2, :school_years_3].each do |n|
        fill_in n, with: Faker::Date.between(15.years.ago, Date.today)
                           .strftime("%Y")
      end
      [:major_1, :major_2, :major_3, :substance_name_1, :substance_name_2,
        :substance_name_3, :substance_name_4, :substance_name_5, :eth_other,
        :other_language]
        .each do |n|
        fill_in n, with: Faker::Lorem.word
      end
      [:graduate_1, :graduate_2, :graduate_3, :ever_worked,
        :worked_last_12_months].each do |n|
        fill_in n, with: ["Yes", "No"].sample
      end

      fill_in :total_years_worked, with: rand(20)
      fill_in :total_number_jobs, with: rand(10)
      [:work_start_date_1, :work_start_date_2, :work_start_date_3,
        :work_start_date_4, :work_start_date_5, :work_end_date_1,
        :work_end_date_2, :work_end_date_3, :work_end_date_4, :work_end_date_5,
        :last_physical_exam_date, :last_dental_exam_date,
        :hospital_start_date_1, :hospital_start_date_2,
        :hospital_start_date_3, :hospital_start_date_4,
        :hospital_start_date_5, :hospital_start_date_6,
        :hospital_start_date_7, :hospital_start_date_8,
        :hospital_start_date_9, :hospital_start_date_10,
        :hospital_end_date_1, :hospital_end_date_2, :hospital_end_date_3,
        :hospital_end_date_4, :hospital_end_date_5, :hospital_end_date_6,
        :hospital_end_date_7, :hospital_end_date_8, :hospital_end_date_9,
        :hospital_end_date_10, :substance_last_use_1, :substance_last_use_2,
        :substance_last_use_3, :substance_last_use_4, :substance_last_use_5,
        :substance_date_started_1, :substance_date_started_2,
        :substance_date_started_3, :substance_date_started_4,
        :substance_date_started_5]
        .each do |n|
          fill_in n, with: Faker::Date.between(15.years.ago, Date.today)
                             .strftime("%b %d, %Y")
        end
      [:work_title_1, :work_title_2, :work_title_3, :work_title_4,
        :work_title_5, :work_type_1, :work_type_2, :work_type_3, :work_type_4,
        :work_type_5]
        .each do |n|
          fill_in n, with: Faker::Lorem.word
        end
      [:work_wage_1, :work_wage_2, :work_wage_3, :work_wage_4, :work_wage_5,
        :work_hours_1, :work_hours_2, :work_hours_3, :work_hours_4,
        :work_hours_5, :hospitalization_count]
        .each do |n|
          fill_in n, with: rand(40)
        end

      [:psych_name, :recommend_name, :therapist_name, :primary_care_name,
        :emerg_primary_name, :emerg_secondary_name, :member_signature]
        .each do |n|
          fill_in n, with: Faker::Name.name
        end
      [:recommend_agency, :psych_agency, :therapist_agency,
        :primary_care_agency, :employer_1, :employer_2, :employer_3,
        :employer_4, :employer_5, :insurance_other, :medicaid_comp,
        :hospital_name_1, :hospital_name_2, :hospital_name_3,
        :hospital_name_4, :hospital_name_5, :hospital_name_6,
        :hospital_name_7, :hospital_name_8, :hospital_name_9,
        :hospital_name_10]
        .each do |n|
          fill_in n, with: Faker::Company.name
        end
      [:phone_number, :recommend_phone_number, :psych_phone, :therapist_phone,
        :primary_care_phone, :emerg_primary_phone, :emerg_secondary_phone]
        .each do |n|
          fill_in n, with: Faker::PhoneNumber.phone_number
        end
      [:street_address, :psych_address, :therapist_address,
        :primary_care_address]
        .each do |n|
          fill_in n, with: Faker::Address.street_address
        end
      [:psych_seeing_length, :recommend_known_length, :therapist_seeing_length]
        .each do |n|
          fill_in n, with: "#{rand(12)} months"
        end
      [:psych_email, :email_address, :recommend_email, :therapist_email,
        :primary_care_email]
        .each do |n|
          fill_in n, with: Faker::Internet.email
        end
      fill_in :emerg_primary_relation, with: "Friend"
      fill_in :emerg_secondary_relation, with: "Mother"

      select("Medicare", from: symbol_to_underscore(:insurance_name))
      fill_in :insurance_num, with: rand(5000000)

      [:hospitalization_precipitants, :why_fh_good_place, :homeless_explanation,
        :work_notes, :med_alert_memo, :medication_info,
        :abuse_history_elaboration, :legal_history_detail, :extra_info]
        .each do |n|
          fill_in n, with: Faker::Lorem.paragraphs(3).join
        end
      [:med_alert_other, :past_treatment_when_and_where,
        :current_treatment_when_and_where]
        .each do |n|
          fill_in n, with: Faker::Lorem.paragraphs(1).join
        end

      fill_in :bronx_or_manhattan, with: "Manhattan"

      [:have_homeless_history, :reside_with_minors, :acs_involvement,
        :are_you_veteran, :harp, :hcbs, :abuse_history_alcohol,
        :abuse_history_drugs, :ever_in_treatment, :currently_in_treatment,
        :interested_in_treatment, :been_in_jail, :been_in_prison,
        :convicted_of_misdemeanor, :arrests_for_felonies,
        :injured_another_person, :history_of_violence,
        :wanted_reduce_substance_use, :been_annoyed_by_substance_criticism,
        :felt_bad_about_substance_use, :ever_used_substances_for_hangover]
        .each do |n|
          select(["Yes", "No"].sample, from: symbol_to_underscore(n))
        end

      [:tour_fh, :eth_aa, :eth_na, :eth_cauc, :eth_asian, :eth_me, :eth_pi,
        :eth_lat, :eth_car, :med_alert_deaf, :med_alert_asthma,
        :med_alert_cpi, :med_alert_allerg, :med_alert_npm, :med_alert_blind,
        :med_alert_recent_surg, :med_alert_diabetes, :med_alert_ep,
        :med_alert_hyper, :less_hs, :some_hs, :ged, :hs_diploma, :trade_school,
        :some_college, :assoc_degree, :bachelors_degree, :some_grad_work,
        :masters_degree, :adv_grad_degree]
        .each do |n|
          check(symbol_to_underscore(n))
        end
    end

    def symbol_to_underscore(symbol)
      symbol.to_s.insert(0, "_")
    end
  end
end
