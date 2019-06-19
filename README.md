# forgood-school-admissions

## Hypothesis

In England, an increased number of children are not getting a place at their first choice high school due to a baby boom towards the end of the 2000s. Children that are turning 11 years old after September 1st (2019) were born in 2008/2009, see summary stats below:

Live Births: England and Wales
| Year | Total |
| 2012 | 729,674 |
| 2011 | 723,913 |
| 2010 | 723,165 |
| 2009 | 706,248 |
| 2008 | 708,711 |
| 2007 | 690,013 |
| 2006 | 669,601 |
| 2005 | 645,835 |
| 2004 | 639,721 |
| 2003 | 621,469 |
| 2002 | 596,122 |
| 2001 | 594,634 |
| 2000 | 604,441 |


## Data Sources
https://www.gov.uk/government/statistics/secondary-and-primary-school-application-and-offers-2019
https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/datasets/birthsummarytables

## Get the data
`curl -O https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/807801/2019_Apps_Offers_UD_time_series.csv`

Download (in browser) https://www.ons.gov.uk/generator?uri=/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/bulletins/birthsummarytablesenglandandwales/2017/a819f426&format=csv and rename as `2017_Live_Births.csv`

## Clean the data

### Applications and Offers

Some of the integer fields contain a 'x' rather than a blank.
`sed -i '' 's/,x/,/g' 2019_Apps_Offers_UD_time_series.csv`

### Live Births

Remove the first 10 lines of non csv data
`sed -i '' '1,9d' 2017_Live_Births.csv`

Remove Total Fertility Rate (3rd column)
`cat 2017_Live_Births.csv | awk -F, '{print $1 "," $2}' > temp && mv temp 2017_Live_Births.csv`

Remove the decimal point (convert to thousands)
`sed -i '' 's/\.//g' 2017_Live_Births.csv`

Add a heading
`sed -i '' '1s/^/"year","live_births"\n/' 2017_Live_Births.csv`
