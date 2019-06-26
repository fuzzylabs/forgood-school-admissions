variable "project" {
  description = "The GCP Project in which resources are created"
  type        = string
  default     = "fuzzylabs"
}

variable "location" {
  description = "The GCP Location in which resources are created"
  type        = string
  default     = "europe-west2"
}

variable "dataset_id" {
  description = "The name of the bigquery dataset"
  type        = string
  default     = "forgood_school_admissions"
}

variable "tables" {
  description = "A list of maps containing table attributes"
  type        = list
  default = [
    {
      "table_id" : "applications_offers",
      "description" : "Source: https://www.gov.uk/government/statistics/secondary-and-primary-school-application-and-offers-2019",
      "schema" : "applications_offers_schema.json",
      "data" : "../data/2019_Apps_Offers_UD_time_series.csv"
    },
    {
      "table_id" : "live_births",
      "description" : "Source: http://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/datasets/birthsummarytables",
      "schema" : "live_births_schema.json",
      "data" : "../data/2017_Live_Births.csv"
    }
  ]
}
