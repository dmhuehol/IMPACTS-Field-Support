# IMPACTS Field Support
 Code created as decision support for IMPACTS deployment.

## Wetbulb profiles
### Setup
1. Clone the repository into a folder. This will be your working directory. **importImpacts** and **TTwv_kFt** are the only two functions that you need to interact with; the other two are helper functions.

### Download files
2. Go to the [IMPACTS catalog](impacts.atmos.washington.edu/), select the “Archive” tab, and choose “Standard” from the “Soundings (ascii)” panel. The IMPACTS catalog includes special launches (e.g. 03, 06, 18 UTC launches), while the University of Wyoming site does not.
3. Navigate to the desired date/time and location. Right-click the file, select “Save Link As…”, select “All files” as the file format, and save the file as a .txt file to the working directory. 

### Making plots
4. Import the data to MATLAB with [sounding_table] = **importImpacts**(filename), where filename is the name of the sounding file as a string. Be sure to put the file name in SINGLE QUOTES.
5. Make an image with **TTwvZ_kFt**(sounding_table,kmTop). kmTop sets the top of the y-axis in kilometers.
6. You can save the figure manually, or you can un-comment the three lines at the end of the function which set the figure size and use the print command to save as a png file.

#### Notes
Be sure to download the file as the correct file type!! The files download as an html file by default, which will not work with the import code.  
The x-limits are set to be from -30˚C to 1˚C greater than the maximum temperature within the plotted part of the column. The limits can be set manually; search for xlim within the code.
