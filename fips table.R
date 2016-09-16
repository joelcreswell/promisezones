fips <- read.csv("US_FIPS_Codes.csv")

fips$ST_county <- if (fips$FIPS_County <100 && fips$FIPS_County >9 ){
  paste(fips$FIPS_State, "0", fips$FIPS_County)
}