resource "google_bigquery_dataset" "default" {
  project    = var.project
  location   = var.location
  dataset_id = var.dataset_id
}

resource "google_bigquery_table" "default" {
  count       = "${length(var.tables)}"
  dataset_id  = "${google_bigquery_dataset.default.dataset_id}"
  project     = var.project
  table_id    = "${lookup(var.tables[count.index], "table_id")}"
  description = "${lookup(var.tables[count.index], "description")}"
  schema      = "${file(lookup(var.tables[count.index], "schema"))}"

    provisioner "local-exec" {
      command = 'bq --location=${var.location} load --skip_leading_rows=1 --source_format=CSV ${var.project}:${google_bigquery_dataset.default.dataset_id}.${lookup(var.tables[count.index], "table_id") ${lookup(var.tables[count.index], "data")}'
    }
}

#resource "google_bigquery_table" "applications_offers" {
#  dataset_id  = "${google_bigquery_dataset.default.dataset_id}"
#  project     = var.project
#  table_id    = "applications_offers"
#  description = "Source: https://www.gov.uk/government/statistics/secondary-and-primary-school-application-and-offers-2019"
#  schema      = "${file("applications_offers_schema.json")}"
#
#  provisioner "local-exec" {
#    command = "bq --location=${var.location} load --skip_leading_rows=1 --source_format=CSV ${var.project}:${google_bigquery_dataset.default.dataset_id}.applications_offers ../data/2019_Apps_Offers_UD_time_series.csv"
#  }
#}
#
#resource "google_bigquery_table" "live_births" {
#  dataset_id  = "${google_bigquery_dataset.default.dataset_id}"
#  project     = var.project
#  table_id    = "live_births"
#  description = "Source: //www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/datasets/birthsummarytables"
#  schema      = "${file("live_births_schema.json")}"
#
#  provisioner "local-exec" {
#    command = "bq --location=${var.location} load --skip_leading_rows=1 --source_format=CSV ${var.project}:${google_bigquery_dataset.default.dataset_id}.live_births ../data/2017_Live_Births.csv"
#  }
#}
