SELECT
  apps_offers.year,
  apps_offers.admission_numbers,
  apps_offers.applications_received,
  (apps_offers.first_preference_offers / apps_offers.applications_received) * 100 as percentage_first_pref,
  (apps_offers.second_preference_offers / apps_offers.applications_received) * 100 as percentage_second_pref,
  (apps_offers.third_preference_offers / apps_offers.applications_received) * 100 as percentage_third_pref,
  (apps_offers.one_of_the_three_preference_offers / apps_offers.applications_received) * 100 as percentage_one_of_three_pref,
  (apps_offers.non_preferred_offer / apps_offers.applications_received) * 100 as percentage_non_preferred,
  apps_offers.second_preference_offers,
  apps_offers.third_preference_offers,
  apps_offers.one_of_the_three_preference_offers,
  apps_offers.non_preferred_offer,
  live_births.live_births
FROM
  `fuzzylabs.forgood_school_admissions.applications_offers` AS apps_offers
JOIN
  `fuzzylabs.forgood_school_admissions.live_births` AS live_births
ON
  # get 'birth_year' from 11 years ago
  live_births.year = apps_offers.year -11
WHERE
  level = 'National'
  AND school_phase = 'Secondary'
