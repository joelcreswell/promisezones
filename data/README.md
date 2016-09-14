----
Files: plots.csv, surveys.csv, species.csv

The Portal Project Teaching Database is a simplified version of the Portal
Project Database designed for teaching. It provides a real world example of
life-history, population, and ecological data, with sufficient complexity to
teach many aspects of data analysis and management, but with many complexities
removed to allow students to focus on the core ideas and skills being taught.

The database is currently available in csv, json, and sqlite.

Use of this dataset should cite: http://dx.doi.org/10.6084/m9.figshare.1314459

This database is not designed for research as it intentionally removes some of
the real-world complexities. The [original database is published at Ecological
Archives](http://esapubs.org/archive/ecol/E090/118/) and this version of the
database should be used for research purposes.

----
Files: nlcd\_agg.\*, nlcd\_proj.*

A portion of the National Land Cover Database (http://www.mrlc.gov/nlcd2011.php) 
that has been cropped and reduced to a lower resolution in order to speed up processing
time for this tutorial. The *nlcd_agg* raster is in the original Albers equal-area
projection, whereas the *nlcd_proj* raster has been reprojected to Web Mercator
for use with the `leaflet` package.

----
Files: cb_500k_maryland/

Maryland county boundaries extracted from the US Census county boundaries
shapefile (http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_500k.zip).


