class FhApplicationForm < App
  UPLOAD_ERROR_MESSAGE = "file must be attached"

  validates :ssn, format: { with: /\A[0-9]{9}\z/,
    message: "must be a 9 digit number" }

  validates :psych_eval, presence: { message: UPLOAD_ERROR_MESSAGE }
  validates :psych_social, presence: { message: UPLOAD_ERROR_MESSAGE }
  validates :insurance_card, presence: { message: UPLOAD_ERROR_MESSAGE }

  extend CarrierWave::Mount

  attr_accessor :first_name, :last_name, :mi, :dob,
    :ssn, :gender, :us_citizen, :street_address,
    :apt, :city, :state, :zip_code, :phone_number, :county,
    :residence_time_length, :email_address, :recommend_name, :recommend_agency,
    :recommend_phone_number, :recommend_agency_type, :recommend_known_length,
    :tour_date, :live_alone_or_with_others, :who_live_with,
    :have_homeless_history, :homeless_explanation, :reside_with_minors,
    :acs_involvement, :ssi, :family_income, :veteran_benefits, :ssdi,
    :snap, :public_assistance, :wages, :retirement_benefits, :other_income,
    :total_income, :recommend_email, :tour_fh, :current_housing_type,
    :eth_other, :other_language, :school_attended_1, :school_years_1, :major_1,
    :graduate_1, :school_attended_2, :school_years_2, :major_2, :graduate_2,
    :school_attended_3, :school_years_3, :major_3, :graduate_3,
    :work_start_date_1, :employer_1,
    :work_title_1, :employer_2, :employer_3, :employer_4, :employer_5,
    :eth_aa, :eth_asian, :eth_na, :eth_cauc, :eth_pi, :eth_aa_ac, :eth_aa_other,
    :eth_aa_unknown, :eth_aa_na, :eth_cuban, :eth_mex, :eth_pr, :eth_dom,
    :eth_sa, :eth_ca,
    :eth_car, :marital_status, :are_you_veteran, :less_hs, :trade_school,
    :some_grad_work, :some_hs, :some_college, :masters_degree, :ged,
    :assoc_degree, :adv_grad_degree, :hs_diploma, :bachelors_degree,
    :ever_worked, :worked_last_12_months, :work_end_date_1, :work_start_date_2,
    :work_end_date_2, :work_start_date_3, :work_end_date_3, :work_start_date_4,
    :work_end_date_4, :work_start_date_5, :work_end_date_5, :work_type_1,
    :work_title_2, :work_type_2, :work_title_3, :work_type_3, :work_title_4,
    :work_type_4, :work_title_5, :work_type_5, :work_notes, :med_alert_other,
    :psych_seeing_length, :psych_email, :therapist_seeing_length,
    :therapist_email, :primary_care_email, :emerg_primary_name,
    :emerg_primary_phone, :emerg_primary_relation, :emerg_secondary_name,
    :emerg_secondary_phone, :emerg_secondary_relation, :medicaid_comp,
    :last_physical_exam_date, :last_dental_exam_date, :med_alert_memo,
    :med_alert_deaf, :med_alert_recent_surg, :med_alert_asthma,
    :med_alert_diabetes, :med_alert_cpi, :med_alert_npm, :med_alert_ep,
    :med_alert_allerg, :med_alert_blind, :med_alert_hyper, :psych_name,
    :psych_agency, :psych_phone, :psych_address, :therapist_name,
    :therapist_agency, :therapist_phone, :therapist_address,
    :primary_care_address, :primary_care_name, :primary_care_agency,
    :primary_care_phone, :insurance_name, :insurance_num, :harp, :hcbs,
    :hospitalization_count,
    :abuse_history_elaboration, :past_treatment_when_and_where,
    :current_treatment_when_and_where, :hospital_name_1, :hospital_start_date_1,
    :hospital_end_date_1, :hospital_name_2, :hospital_start_date_2,
    :hospital_end_date_2, :hospital_name_3, :hospital_start_date_3,
    :hospital_end_date_3, :hospital_name_4, :hospital_start_date_4,
    :hospital_end_date_4, :hospital_name_5, :hospital_start_date_5,
    :hospital_end_date_5, :hospital_name_6, :hospital_start_date_6,
    :hospital_end_date_6, :hospital_name_7, :hospital_start_date_7,
    :hospital_end_date_7, :hospital_name_8, :hospital_start_date_8,
    :hospital_end_date_8, :hospital_name_9, :hospital_start_date_9,
    :hospital_end_date_9, :hospital_name_10, :hospital_start_date_10,
    :hospital_end_date_10, :abuse_history_alcohol, :abuse_history_drugs,
    :ever_in_treatment, :currently_in_treatment, :interested_in_treatment,
    :legal_history_detail, :bronx_or_manhattan, :member_signature,
    :member_signature_date, :been_in_jail, :been_in_prison,
    :convicted_of_misdemeanor, :arrests_for_felonies, :injured_another_person,
    :history_of_violence, :drug_questions_name, :drug_questions_date,
    :wanted_reduce_substance_use, :been_annoyed_by_substance_criticism,
    :felt_bad_about_substance_use, :ever_used_substances_for_hangover,
    :insurance_other, :psych_social, :psych_eval, :insurance_card, :hosp_precip_1,
    :hosp_precip_2, :hosp_precip_3, :hosp_precip_4, :hosp_precip_5,
    :hosp_precip_6, :hosp_precip_7, :hosp_precip_8, :hosp_precip_9,
    :hosp_precip_10, :med_name_1, :med_name_2, :med_name_3, :med_name_4,
    :med_name_5, :med_name_6, :med_dosage_1, :med_dosage_2, :med_dosage_3,
    :med_dosage_4, :med_dosage_5, :med_dosage_6, :med_freq_1, :med_freq_2,
    :med_freq_3, :med_freq_4, :med_freq_5, :med_freq_6, :age, :place_of_birth,
    :main_goal, :main_goal_other_text, :what_challenges, :have_children,
    :children_number, :dsm_v, :other_sup_text, :referral_signature, :referral_signature_date,
    :recommend_type, :get_needs_met, :feel_part, :sub_abuse_check, :work_prog_check,
    :acces_vr_check, :edu_sup_check, :act_team_check

  mount_uploader :psych_eval, PsychEvalUploader

  mount_uploader :psych_social, PsychSocialUploader

  mount_uploader :insurance_card, InsuranceCardUploader

  def attachment_content_whitelist
    ["application/pdf",
     "application/msword",
     "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
     "image/jpeg"]
  end

  def fill_out
    text_checkbox_fill_out

    fill(:drug_questions_name,
         (self.send(:first_name) + " " + self.send(:last_name))
        )
    todays_date = Date.today.strftime("%b %d, %Y")
    fill(:drug_questions_date, todays_date)
    fill(:member_signature_date, todays_date)
    fill(:referral_signature_date, todays_date)
    ssn_splitter(self.send(:ssn)).each {|key, value| fill(key, value)}
    fill(:tour_fh, "1") if self.send(:tour_fh) == "Yes"
  end

  def text_checkbox_fill_out
    text_fields = [
      :first_name, :last_name, :mi, :dob, :age,
      :gender, :us_citizen, :street_address, :apt, :city, :state, :zip_code,
      :phone_number, :county, :residence_time_length, :email_address,
      :recommend_name, :recommend_agency, :recommend_phone_number,
      :recommend_agency_type, :recommend_known_length,
      :tour_date, :live_alone_or_with_others, :who_live_with,
      :have_homeless_history, :homeless_explanation, :reside_with_minors,
      :acs_involvement, :ssi, :family_income, :veteran_benefits, :ssdi, :snap,
      :public_assistance, :wages, :retirement_benefits, :other_income,
      :total_income, :recommend_email, :current_housing_type, :other_language,
      :school_attended_1, :school_years_1, :major_1, :graduate_1,
      :school_attended_2, :school_years_2, :major_2, :graduate_2,
      :school_attended_3, :school_years_3, :major_3, :graduate_3,
      :work_start_date_1, :employer_1,
      :work_title_1, :employer_2, :employer_3, :employer_4, :employer_5,
      :marital_status, :are_you_veteran, :ever_worked, :worked_last_12_months,
      :work_end_date_1, :work_start_date_2, :work_end_date_2,
      :work_start_date_3, :work_end_date_3, :work_start_date_4,
      :work_end_date_4, :work_start_date_5, :work_end_date_5, :work_type_1,
      :work_title_2, :work_type_2, :work_title_3, :work_type_3, :work_title_4,
      :work_type_4, :work_title_5, :work_type_5, :work_notes, :med_alert_other,
      :psych_seeing_length, :psych_email, :therapist_seeing_length,
      :therapist_email, :primary_care_email, :emerg_primary_name,
      :emerg_primary_phone, :emerg_primary_relation, :emerg_secondary_name,
      :emerg_secondary_phone, :emerg_secondary_relation, :medicaid_comp,
      :last_physical_exam_date, :last_dental_exam_date, :med_alert_memo,
      :psych_name, :psych_agency, :psych_phone, :psych_address, :therapist_name,
      :therapist_agency, :therapist_phone, :therapist_address,
      :primary_care_address, :primary_care_name, :primary_care_agency,
      :primary_care_phone, :insurance_name, :insurance_num, :harp, :hcbs,
      :hospitalization_count,
      :abuse_history_elaboration, :past_treatment_when_and_where,
      :current_treatment_when_and_where, :hospital_name_1,
      :hospital_start_date_1, :hospital_end_date_1, :hospital_name_2,
      :hospital_start_date_2, :hospital_end_date_2, :hospital_name_3,
      :hospital_start_date_3, :hospital_end_date_3, :hospital_name_4,
      :hospital_start_date_4, :hospital_end_date_4, :hospital_name_5,
      :hospital_start_date_5, :hospital_end_date_5, :hospital_name_6,
      :hospital_start_date_6, :hospital_end_date_6, :hospital_name_7,
      :hospital_start_date_7, :hospital_end_date_7, :hospital_name_8,
      :hospital_start_date_8, :hospital_end_date_8, :hospital_name_9,
      :hospital_start_date_9, :hospital_end_date_9, :hospital_name_10,
      :hospital_start_date_10, :hospital_end_date_10, :abuse_history_alcohol,
      :abuse_history_drugs, :ever_in_treatment, :currently_in_treatment,
      :interested_in_treatment, :legal_history_detail,
      :bronx_or_manhattan, :member_signature, :member_signature_date,
      :insurance_other, :wanted_reduce_substance_use,
      :been_annoyed_by_substance_criticism, :felt_bad_about_substance_use,
      :ever_used_substances_for_hangover, :been_in_jail, :been_in_prison,
      :convicted_of_misdemeanor, :arrests_for_felonies, :injured_another_person,
      :history_of_violence, :hosp_precip_1,
      :hosp_precip_2, :hosp_precip_3, :hosp_precip_4, :hosp_precip_5,
      :hosp_precip_6, :hosp_precip_7, :hosp_precip_8, :hosp_precip_9,
      :hosp_precip_10, :med_name_1, :med_name_2, :med_name_3, :med_name_4,
      :med_name_5, :med_name_6, :med_dosage_1, :med_dosage_2, :med_dosage_3,
      :med_dosage_4, :med_dosage_5, :med_dosage_6, :med_freq_1, :med_freq_2,
      :med_freq_3, :med_freq_4, :med_freq_5, :med_freq_6, :age, :place_of_birth,
      :main_goal, :main_goal_other_text, :what_challenges, :have_children,
      :children_number, :dsm_v, :other_sup_text, :referral_signature, :referral_signature_date,
      :recommend_type, :get_needs_met, :feel_part
    ]

    checkboxes = [
      :eth_other, :eth_aa, :eth_asian, :eth_na, :eth_aa_ac, :eth_aa_other,
      :eth_aa_unknown, :eth_aa_na, :eth_cuban, :eth_mex, :eth_pr, :eth_dom,
      :eth_sa, :eth_ca,
      :eth_cauc, :eth_pi, :eth_car, :less_hs, :trade_school, :some_grad_work,
      :some_hs, :some_college, :masters_degree, :ged, :assoc_degree,
      :adv_grad_degree, :hs_diploma, :bachelors_degree, :med_alert_deaf,
      :med_alert_recent_surg, :med_alert_asthma, :med_alert_diabetes,
      :med_alert_cpi, :med_alert_npm, :med_alert_ep, :med_alert_allerg,
      :med_alert_blind, :med_alert_hyper, :sub_abuse_check, :work_prog_check,
      :acces_vr_check, :edu_sup_check, :act_team_check
    ]

    (text_fields + checkboxes).each do |field|
      fill(field, self.send(field))
    end
  end

  def ssn_splitter(ssn)
    ssn_hash = {}
    ssn_hash[:ssn_1] = ssn[0..2]
    ssn_hash[:ssn_2] = ssn[3..4]
    ssn_hash[:ssn_3] = ssn[5..8]
    ssn_hash
  end

  def attachment_save_basename(attachment)
    file_path = attachment.path
    base_save_name = File.basename(file_path, File.extname(file_path))
    base_save_name + "-#{unique_code}"
  end

  def unique_code
    @unique_code ||= SecureRandom.uuid
  end

  def save(app_file_path)
    uploaded_app = AppS3Uploader.new(app_file_path, unique_code).upload
    self.store_psych_eval!
    self.store_psych_social!
    self.store_insurance_card!
    { app: uploaded_app.public_url,
      psych_eval: self.psych_eval.url,
      psych_social: self.psych_social.url,
      insurance_card: self.insurance_card.url }
  end
end
