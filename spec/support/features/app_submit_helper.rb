module Features
  module AppSubmitHelpers
    def fill_out_app
      Faker::Config.locale = "en-US"
      
      fill_in :first_name, with: Faker::Name.first_name
      fill_in :last_name, with: Faker::Name.last_name
      fill_in :mi, with: "A"
      fill_in :dob, with: Faker::Date.between(40.years.ago, 20.years.ago)
                            .strftime("%b %d, %Y")
      fill_in :place_of_birth, with: Faker::Address.city
      fill_in :ssn, with: Faker::Number.number(9)
      fill_in :gender, with: "Female"
      fill_in :apt, with: Faker::Address.secondary_address
      fill_in :city, with: Faker::Address.city
      fill_in :state, with: Faker::Address.state
      fill_in :zip_code, with: Faker::Address.zip
      fill_in :county, with: Faker::Address.city
      fill_in :residence_time_length, with: "#{rand(20)} years"

      fill_in :children_number, with: Faker::Number.number(1)

      fill_in :recommend_agency_type, with: Faker::Company.buzzword

      fill_in :tour_date, with: Faker::Time.backward(14).strftime("%b %d, %Y")

      select("Education", from: (:main_goal).to_s)

      select("Home of Family Member",
        from: (:current_housing_type).to_s)
      select("With others",
        from: (:live_alone_or_with_others).to_s)
      fill_in :who_live_with, with: "Parents"

      [:ssi, :ssdi, :wages, :family_income, :snap, :retirement_benefits,
        :veteran_benefits, :public_assistance, :other_income,
        :total_income]. each {|n| fill_in n, with: rand(200)}

      select("Permanent Partner",
        from: (:marital_status).to_s)

      [:school_attended_1, :school_attended_2, :school_attended_3].each do |n|
        fill_in n, with: Faker::Educator.university
      end
      [:school_years_1, :school_years_2, :school_years_3].each do |n|
        fill_in n, with: Faker::Date.between(15.years.ago, Date.today)
                           .strftime("%Y")
      end
      [:major_1, :major_2, :major_3, :eth_other,
        :other_language, :med_name_1, :med_name_2, :med_name_3, :med_name_4,
        :med_name_5, :med_name_6, :med_dosage_1, :med_dosage_2, :med_dosage_3,
        :med_dosage_4, :med_dosage_5, :med_dosage_6, :med_freq_1, :med_freq_2,
        :med_freq_3, :med_freq_4, :med_freq_5, :med_freq_6]
        .each do |n|
        fill_in n, with: Faker::Lorem.word
      end

      [:graduate_1, :graduate_2, :graduate_3].each do |n|
        fill_in n, with: ["Yes", "No"].sample
      end

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
        :hospital_end_date_10]
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
      [:hospitalization_count]
        .each do |n|
          fill_in n, with: rand(40)
        end

      [:psych_name, :recommend_name, :therapist_name, :primary_care_name,
        :emerg_primary_name, :emerg_secondary_name, :member_signature, :referral_signature]
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

      select("Medicare", from: (:insurance_name).to_s)
      fill_in :insurance_num, with: rand(5000000)

      select("Inpatient", from: (:recommend_type).to_s)

      select("Somewhat", from: (:get_needs_met).to_s)

      select("Somewhat", from: (:feel_part).to_s)

      [:homeless_explanation,
        :work_notes, :med_alert_memo,
        :abuse_history_elaboration, :legal_history_detail,
        :hosp_precip_1, :hosp_precip_2, :hosp_precip_3, :hosp_precip_4,
        :hosp_precip_5, :hosp_precip_6, :hosp_precip_7, :hosp_precip_8,
        :hosp_precip_9, :hosp_precip_10]
        .each do |n|
          fill_in n, with: Faker::Lorem.paragraphs(3).join
        end
      [:med_alert_other, :past_treatment_when_and_where,
        :current_treatment_when_and_where, :main_goal_other_text, :what_challenges,
        :dsm_v, :other_sup_text]
        .each do |n|
          fill_in n, with: Faker::Lorem.paragraphs(1).join
        end

      [:have_homeless_history, :reside_with_minors, :acs_involvement,
        :are_you_veteran, :harp, :hcbs, :abuse_history_alcohol,
        :abuse_history_drugs, :ever_in_treatment, :currently_in_treatment,
        :interested_in_treatment, :us_citizen, :have_children]
        .each do |n|
          select(["Yes", "No"].sample, from: (n).to_s)
        end

      [:eth_aa, :eth_na, :eth_cauc, :eth_asian, :eth_pi,
        :eth_car, :eth_aa_ac, :eth_aa_other,
        :eth_aa_unknown, :eth_aa_na, :eth_cuban, :eth_mex, :eth_pr, :eth_dom,
        :eth_sa, :eth_ca,
        :med_alert_deaf, :med_alert_asthma,
        :med_alert_cpi, :med_alert_allerg, :med_alert_npm, :med_alert_blind,
        :med_alert_recent_surg, :med_alert_diabetes, :med_alert_ep,
        :med_alert_hyper, :less_hs, :some_hs, :ged, :hs_diploma, :trade_school,
        :some_college, :assoc_degree, :bachelors_degree, :some_grad_work,
        :masters_degree, :adv_grad_degree, :sub_abuse_check, :work_prog_check,
        :acces_vr_check, :edu_sup_check, :act_team_check]
        .each do |n|
          check((n).to_s)
        end

      [:wanted_reduce_substance_use,
      :been_annoyed_by_substance_criticism, :felt_bad_about_substance_use,
      :ever_used_substances_for_hangover, :been_in_jail, :been_in_prison,
      :convicted_of_misdemeanor, :arrests_for_felonies, :injured_another_person,
      :history_of_violence]
      .each do |n|
        choose("#{(n).to_s}_#{["no", "yes"].sample}")
      end

      choose("tour_fh_yes")

      choose("bronx_or_manhattan_manhattan")
    end
  end
end
