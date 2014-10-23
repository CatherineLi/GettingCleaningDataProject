CodeBook for TidyData
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

Research Design 
(It describes how the raw data was collected.)  
===============================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See feature section below for details. 

Raw Data
=========
-Name: datafull
-Dimensions:  10299 rows, 563 columns.
-Column Description: 563 columns include "subjectID" column, "activities" column, and 561 feature variable columns. 
-Data Values: SubjectID column ranges from 1 to 30 representing the 30 participating subjects; "activities" column values include "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_UPSTAIRS", 
"WALKING_DOWNSTAIRS". 
-UNITS: 561 Feature variable values are normalized and bounded within [-1, 1]. 


Tidy Data
=======================
- Name: TidyData
- Dimension: 180 rows, 561 columns.  
- Row Description: TidyData has 180 rows. Each row represents a subject performing an activity. Given we have 30 subjects and each subject performs six activities, we have 180 rows. 
- Column Description: TidyData has 561 columns. Each column represents an averaged measure about a feature variable. Variable Description section describes these feature variables in details.
- Data Values: Data values in TidyData represent the AVERAGE of the raw measures about a feature variable for each subject and each activity. Transformation details are listed in a separate section.  
- UNITS: 561 Feature variable values are normalized and bounded within [-1, 1].

Transformation from Raw data "datafull" to Tidy Data "TidyData"
================================================================
TidyData represents the average of all the raw measures of a feature variable, for each subject and each activity. Here is an example to illustrate the transformation:
 
In raw dataset "datafull", for subjectID==1 and activities==LAYING, here is how data appears for feature variable tBodyAccmeanX (I focus on one feature only for ease of illustration, 
the same thing applies to all the other 560 features).

|subjectID   |activities     |tBodyAccmeanX
|------------|---------------|-------------
|1           |LAYING         |0.4
|1           |LAYING         |0.28
|1           |LAYING         |0.34
|1           |LAYING         |0.01
...

In TidyData, each row represents a subjectID performing an activity. That is, there is only one row for "subjectID==1 & activities=="LAYING"". To generate a summary of measures about 
tBodyAccmeanX for "subjectID==1 & activities=="LAYING", I took an average of all the raw data values by colMeans and and the resultant  average value shows up in the tidydata. 
Here is how TidyData replaces datafull to capture only the summary information.

     |tBodyAccmeanX
  ---------------------------------------------
 |1  |average value of (0.4, 0.28, 0.34, 0.01)


TidyData Variable Description
==============================

Introduction
--------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAccXYZ and tGyroXYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 


Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAccXYZ and tGravityAccXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerkXYZ and tBodyGyroJerkXYZ). 

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAccXYZ, fBodyAccJerkXYZ, fBodyGyroXYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccXYZ
tGravityAccXYZ
tBodyAccJerkXYZ
tBodyGyroXYZ
tBodyGyroJerkXYZ

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag

fBodyAccXYZ
fBodyAccJerkXYZ
fBodyGyroXYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
mad: Median absolute deviation 
max: Largest value in array
min: Smallest value in array
sma: Signal magnitude area
energy: Energy measure. Sum of the squares divided by the number of values. 
iqr: Interquartile range 
entropy: Signal entropy
arCoeff: Autorregresion coefficients with Burg order equal to 4
correlation: correlation coefficient between two signals
maxInds: index of the frequency component with largest magnitude
meanFreq: Weighted average of the frequency components to obtain a mean frequency
skewness: skewness of the frequency domain signal 
kurtosis: kurtosis of the frequency domain signal 
bandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.
angle: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Here is a complete list of 561 feature variables
------------------------------------------------

tBodyAccmeanX
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ
tBodyAccmadX
tBodyAccmadY
tBodyAccmadZ
tBodyAccmaxX
tBodyAccmaxY
tBodyAccmaxZ
tBodyAccminX
tBodyAccminY
tBodyAccminZ
tBodyAccsma
tBodyAccenergyX
tBodyAccenergyY
tBodyAccenergyZ
tBodyAcciqrX
tBodyAcciqrY
tBodyAcciqrZ
tBodyAccentropyX
tBodyAccentropyY
tBodyAccentropyZ
tBodyAccarCoeffX.1
tBodyAccarCoeffX.2
tBodyAccarCoeffX.3
tBodyAccarCoeffX.4
tBodyAccarCoeffY.1
tBodyAccarCoeffY.2
tBodyAccarCoeffY.3
tBodyAccarCoeffY.4
tBodyAccarCoeffZ.1
tBodyAccarCoeffZ.2
tBodyAccarCoeffZ.3
tBodyAccarCoeffZ.4
tBodyAcccorrelationX.Y
tBodyAcccorrelationX.Z
tBodyAcccorrelationY.Z
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tGravityAccmadX
tGravityAccmadY
tGravityAccmadZ
tGravityAccmaxX
tGravityAccmaxY
tGravityAccmaxZ
tGravityAccminX
tGravityAccminY
tGravityAccminZ
tGravityAccsma
tGravityAccenergyX
tGravityAccenergyY
tGravityAccenergyZ
tGravityAcciqrX
tGravityAcciqrY
tGravityAcciqrZ
tGravityAccentropyX
tGravityAccentropyY
tGravityAccentropyZ
tGravityAccarCoeffX.1
tGravityAccarCoeffX.2
tGravityAccarCoeffX.3
tGravityAccarCoeffX.4
tGravityAccarCoeffY.1
tGravityAccarCoeffY.2
tGravityAccarCoeffY.3
tGravityAccarCoeffY.4
tGravityAccarCoeffZ.1
tGravityAccarCoeffZ.2
tGravityAccarCoeffZ.3
tGravityAccarCoeffZ.4
tGravityAcccorrelationX.Y
tGravityAcccorrelationX.Z
tGravityAcccorrelationY.Z
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyAccJerkmadX
tBodyAccJerkmadY
tBodyAccJerkmadZ
tBodyAccJerkmaxX
tBodyAccJerkmaxY
tBodyAccJerkmaxZ
tBodyAccJerkminX
tBodyAccJerkminY
tBodyAccJerkminZ
tBodyAccJerksma
tBodyAccJerkenergyX
tBodyAccJerkenergyY
tBodyAccJerkenergyZ
tBodyAccJerkiqrX
tBodyAccJerkiqrY
tBodyAccJerkiqrZ
tBodyAccJerkentropyX
tBodyAccJerkentropyY
tBodyAccJerkentropyZ
tBodyAccJerkarCoeffX.1
tBodyAccJerkarCoeffX.2
tBodyAccJerkarCoeffX.3
tBodyAccJerkarCoeffX.4
tBodyAccJerkarCoeffY.1
tBodyAccJerkarCoeffY.2
tBodyAccJerkarCoeffY.3
tBodyAccJerkarCoeffY.4
tBodyAccJerkarCoeffZ.1
tBodyAccJerkarCoeffZ.2
tBodyAccJerkarCoeffZ.3
tBodyAccJerkarCoeffZ.4
tBodyAccJerkcorrelationX.Y
tBodyAccJerkcorrelationX.Z
tBodyAccJerkcorrelationY.Z
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyromadX
tBodyGyromadY
tBodyGyromadZ
tBodyGyromaxX
tBodyGyromaxY
tBodyGyromaxZ
tBodyGyrominX
tBodyGyrominY
tBodyGyrominZ
tBodyGyrosma
tBodyGyroenergyX
tBodyGyroenergyY
tBodyGyroenergyZ
tBodyGyroiqrX
tBodyGyroiqrY
tBodyGyroiqrZ
tBodyGyroentropyX
tBodyGyroentropyY
tBodyGyroentropyZ
tBodyGyroarCoeffX.1
tBodyGyroarCoeffX.2
tBodyGyroarCoeffX.3
tBodyGyroarCoeffX.4
tBodyGyroarCoeffY.1
tBodyGyroarCoeffY.2
tBodyGyroarCoeffY.3
tBodyGyroarCoeffY.4
tBodyGyroarCoeffZ.1
tBodyGyroarCoeffZ.2
tBodyGyroarCoeffZ.3
tBodyGyroarCoeffZ.4
tBodyGyrocorrelationX.Y
tBodyGyrocorrelationX.Z
tBodyGyrocorrelationY.Z
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyGyroJerkmadX
tBodyGyroJerkmadY
tBodyGyroJerkmadZ
tBodyGyroJerkmaxX
tBodyGyroJerkmaxY
tBodyGyroJerkmaxZ
tBodyGyroJerkminX
tBodyGyroJerkminY
tBodyGyroJerkminZ
tBodyGyroJerksma
tBodyGyroJerkenergyX
tBodyGyroJerkenergyY
tBodyGyroJerkenergyZ
tBodyGyroJerkiqrX
tBodyGyroJerkiqrY
tBodyGyroJerkiqrZ
tBodyGyroJerkentropyX
tBodyGyroJerkentropyY
tBodyGyroJerkentropyZ
tBodyGyroJerkarCoeffX.1
tBodyGyroJerkarCoeffX.2
tBodyGyroJerkarCoeffX.3
tBodyGyroJerkarCoeffX.4
tBodyGyroJerkarCoeffY.1
tBodyGyroJerkarCoeffY.2
tBodyGyroJerkarCoeffY.3
tBodyGyroJerkarCoeffY.4
tBodyGyroJerkarCoeffZ.1
tBodyGyroJerkarCoeffZ.2
tBodyGyroJerkarCoeffZ.3
tBodyGyroJerkarCoeffZ.4
tBodyGyroJerkcorrelationX.Y
tBodyGyroJerkcorrelationX.Z
tBodyGyroJerkcorrelationY.Z
tBodyAccMagmean
tBodyAccMagstd
tBodyAccMagmad
tBodyAccMagmax
tBodyAccMagmin
tBodyAccMagsma
tBodyAccMagenergy
tBodyAccMagiqr
tBodyAccMagentropy
tBodyAccMagarCoeff1
tBodyAccMagarCoeff2
tBodyAccMagarCoeff3
tBodyAccMagarCoeff4
tGravityAccMagmean
tGravityAccMagstd
tGravityAccMagmad
tGravityAccMagmax
tGravityAccMagmin
tGravityAccMagsma
tGravityAccMagenergy
tGravityAccMagiqr
tGravityAccMagentropy
tGravityAccMagarCoeff1
tGravityAccMagarCoeff2
tGravityAccMagarCoeff3
tGravityAccMagarCoeff4
tBodyAccJerkMagmean
tBodyAccJerkMagstd
tBodyAccJerkMagmad
tBodyAccJerkMagmax
tBodyAccJerkMagmin
tBodyAccJerkMagsma
tBodyAccJerkMagenergy
tBodyAccJerkMagiqr
tBodyAccJerkMagentropy
tBodyAccJerkMagarCoeff1
tBodyAccJerkMagarCoeff2
tBodyAccJerkMagarCoeff3
tBodyAccJerkMagarCoeff4
tBodyGyroMagmean
tBodyGyroMagstd
tBodyGyroMagmad
tBodyGyroMagmax
tBodyGyroMagmin
tBodyGyroMagsma
tBodyGyroMagenergy
tBodyGyroMagiqr
tBodyGyroMagentropy
tBodyGyroMagarCoeff1
tBodyGyroMagarCoeff2
tBodyGyroMagarCoeff3
tBodyGyroMagarCoeff4
tBodyGyroJerkMagmean
tBodyGyroJerkMagstd
tBodyGyroJerkMagmad
tBodyGyroJerkMagmax
tBodyGyroJerkMagmin
tBodyGyroJerkMagsma
tBodyGyroJerkMagenergy
tBodyGyroJerkMagiqr
tBodyGyroJerkMagentropy
tBodyGyroJerkMagarCoeff1
tBodyGyroJerkMagarCoeff2
tBodyGyroJerkMagarCoeff3
tBodyGyroJerkMagarCoeff4
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccmadX
fBodyAccmadY
fBodyAccmadZ
fBodyAccmaxX
fBodyAccmaxY
fBodyAccmaxZ
fBodyAccminX
fBodyAccminY
fBodyAccminZ
fBodyAccsma
fBodyAccenergyX
fBodyAccenergyY
fBodyAccenergyZ
fBodyAcciqrX
fBodyAcciqrY
fBodyAcciqrZ
fBodyAccentropyX
fBodyAccentropyY
fBodyAccentropyZ
fBodyAccmaxIndsX
fBodyAccmaxIndsY
fBodyAccmaxIndsZ
fBodyAccmeanFreqX
fBodyAccmeanFreqY
fBodyAccmeanFreqZ
fBodyAccskewnessX
fBodyAcckurtosisX
fBodyAccskewnessY
fBodyAcckurtosisY
fBodyAccskewnessZ
fBodyAcckurtosisZ
fBodyAccbandsEnergy1.8
fBodyAccbandsEnergy9.16
fBodyAccbandsEnergy17.24
fBodyAccbandsEnergy25.32
fBodyAccbandsEnergy33.40
fBodyAccbandsEnergy41.48
fBodyAccbandsEnergy49.56
fBodyAccbandsEnergy57.64
fBodyAccbandsEnergy1.16
fBodyAccbandsEnergy17.32
fBodyAccbandsEnergy33.48
fBodyAccbandsEnergy49.64
fBodyAccbandsEnergy1.24
fBodyAccbandsEnergy25.48
fBodyAccbandsEnergy1.8.1
fBodyAccbandsEnergy9.16.1
fBodyAccbandsEnergy17.24.1
fBodyAccbandsEnergy25.32.1
fBodyAccbandsEnergy33.40.1
fBodyAccbandsEnergy41.48.1
fBodyAccbandsEnergy49.56.1
fBodyAccbandsEnergy57.64.1
fBodyAccbandsEnergy1.16.1
fBodyAccbandsEnergy17.32.1
fBodyAccbandsEnergy33.48.1
fBodyAccbandsEnergy49.64.1
fBodyAccbandsEnergy1.24.1
fBodyAccbandsEnergy25.48.1
fBodyAccbandsEnergy1.8.2
fBodyAccbandsEnergy9.16.2
fBodyAccbandsEnergy17.24.2
fBodyAccbandsEnergy25.32.2
fBodyAccbandsEnergy33.40.2
fBodyAccbandsEnergy41.48.2
fBodyAccbandsEnergy49.56.2
fBodyAccbandsEnergy57.64.2
fBodyAccbandsEnergy1.16.2
fBodyAccbandsEnergy17.32.2
fBodyAccbandsEnergy33.48.2
fBodyAccbandsEnergy49.64.2
fBodyAccbandsEnergy1.24.2
fBodyAccbandsEnergy25.48.2
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyAccJerkmadX
fBodyAccJerkmadY
fBodyAccJerkmadZ
fBodyAccJerkmaxX
fBodyAccJerkmaxY
fBodyAccJerkmaxZ
fBodyAccJerkminX
fBodyAccJerkminY
fBodyAccJerkminZ
fBodyAccJerksma
fBodyAccJerkenergyX
fBodyAccJerkenergyY
fBodyAccJerkenergyZ
fBodyAccJerkiqrX
fBodyAccJerkiqrY
fBodyAccJerkiqrZ
fBodyAccJerkentropyX
fBodyAccJerkentropyY
fBodyAccJerkentropyZ
fBodyAccJerkmaxIndsX
fBodyAccJerkmaxIndsY
fBodyAccJerkmaxIndsZ
fBodyAccJerkmeanFreqX
fBodyAccJerkmeanFreqY
fBodyAccJerkmeanFreqZ
fBodyAccJerkskewnessX
fBodyAccJerkkurtosisX
fBodyAccJerkskewnessY
fBodyAccJerkkurtosisY
fBodyAccJerkskewnessZ
fBodyAccJerkkurtosisZ
fBodyAccJerkbandsEnergy1.8
fBodyAccJerkbandsEnergy9.16
fBodyAccJerkbandsEnergy17.24
fBodyAccJerkbandsEnergy25.32
fBodyAccJerkbandsEnergy33.40
fBodyAccJerkbandsEnergy41.48
fBodyAccJerkbandsEnergy49.56
fBodyAccJerkbandsEnergy57.64
fBodyAccJerkbandsEnergy1.16
fBodyAccJerkbandsEnergy17.32
fBodyAccJerkbandsEnergy33.48
fBodyAccJerkbandsEnergy49.64
fBodyAccJerkbandsEnergy1.24
fBodyAccJerkbandsEnergy25.48
fBodyAccJerkbandsEnergy1.8.1
fBodyAccJerkbandsEnergy9.16.1
fBodyAccJerkbandsEnergy17.24.1
fBodyAccJerkbandsEnergy25.32.1
fBodyAccJerkbandsEnergy33.40.1
fBodyAccJerkbandsEnergy41.48.1
fBodyAccJerkbandsEnergy49.56.1
fBodyAccJerkbandsEnergy57.64.1
fBodyAccJerkbandsEnergy1.16.1
fBodyAccJerkbandsEnergy17.32.1
fBodyAccJerkbandsEnergy33.48.1
fBodyAccJerkbandsEnergy49.64.1
fBodyAccJerkbandsEnergy1.24.1
fBodyAccJerkbandsEnergy25.48.1
fBodyAccJerkbandsEnergy1.8.2
fBodyAccJerkbandsEnergy9.16.2
fBodyAccJerkbandsEnergy17.24.2
fBodyAccJerkbandsEnergy25.32.2
fBodyAccJerkbandsEnergy33.40.2
fBodyAccJerkbandsEnergy41.48.2
fBodyAccJerkbandsEnergy49.56.2
fBodyAccJerkbandsEnergy57.64.2
fBodyAccJerkbandsEnergy1.16.2
fBodyAccJerkbandsEnergy17.32.2
fBodyAccJerkbandsEnergy33.48.2
fBodyAccJerkbandsEnergy49.64.2
fBodyAccJerkbandsEnergy1.24.2
fBodyAccJerkbandsEnergy25.48.2
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyGyromadX
fBodyGyromadY
fBodyGyromadZ
fBodyGyromaxX
fBodyGyromaxY
fBodyGyromaxZ
fBodyGyrominX
fBodyGyrominY
fBodyGyrominZ
fBodyGyrosma
fBodyGyroenergyX
fBodyGyroenergyY
fBodyGyroenergyZ
fBodyGyroiqrX
fBodyGyroiqrY
fBodyGyroiqrZ
fBodyGyroentropyX
fBodyGyroentropyY
fBodyGyroentropyZ
fBodyGyromaxIndsX
fBodyGyromaxIndsY
fBodyGyromaxIndsZ
fBodyGyromeanFreqX
fBodyGyromeanFreqY
fBodyGyromeanFreqZ
fBodyGyroskewnessX
fBodyGyrokurtosisX
fBodyGyroskewnessY
fBodyGyrokurtosisY
fBodyGyroskewnessZ
fBodyGyrokurtosisZ
fBodyGyrobandsEnergy1.8
fBodyGyrobandsEnergy9.16
fBodyGyrobandsEnergy17.24
fBodyGyrobandsEnergy25.32
fBodyGyrobandsEnergy33.40
fBodyGyrobandsEnergy41.48
fBodyGyrobandsEnergy49.56
fBodyGyrobandsEnergy57.64
fBodyGyrobandsEnergy1.16
fBodyGyrobandsEnergy17.32
fBodyGyrobandsEnergy33.48
fBodyGyrobandsEnergy49.64
fBodyGyrobandsEnergy1.24
fBodyGyrobandsEnergy25.48
fBodyGyrobandsEnergy1.8.1
fBodyGyrobandsEnergy9.16.1
fBodyGyrobandsEnergy17.24.1
fBodyGyrobandsEnergy25.32.1
fBodyGyrobandsEnergy33.40.1
fBodyGyrobandsEnergy41.48.1
fBodyGyrobandsEnergy49.56.1
fBodyGyrobandsEnergy57.64.1
fBodyGyrobandsEnergy1.16.1
fBodyGyrobandsEnergy17.32.1
fBodyGyrobandsEnergy33.48.1
fBodyGyrobandsEnergy49.64.1
fBodyGyrobandsEnergy1.24.1
fBodyGyrobandsEnergy25.48.1
fBodyGyrobandsEnergy1.8.2
fBodyGyrobandsEnergy9.16.2
fBodyGyrobandsEnergy17.24.2
fBodyGyrobandsEnergy25.32.2
fBodyGyrobandsEnergy33.40.2
fBodyGyrobandsEnergy41.48.2
fBodyGyrobandsEnergy49.56.2
fBodyGyrobandsEnergy57.64.2
fBodyGyrobandsEnergy1.16.2
fBodyGyrobandsEnergy17.32.2
fBodyGyrobandsEnergy33.48.2
fBodyGyrobandsEnergy49.64.2
fBodyGyrobandsEnergy1.24.2
fBodyGyrobandsEnergy25.48.2
fBodyAccMagmean
fBodyAccMagstd
fBodyAccMagmad
fBodyAccMagmax
fBodyAccMagmin
fBodyAccMagsma
fBodyAccMagenergy
fBodyAccMagiqr
fBodyAccMagentropy
fBodyAccMagmaxInds
fBodyAccMagmeanFreq
fBodyAccMagskewness
fBodyAccMagkurtosis
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyAccJerkMagmad
fBodyBodyAccJerkMagmax
fBodyBodyAccJerkMagmin
fBodyBodyAccJerkMagsma
fBodyBodyAccJerkMagenergy
fBodyBodyAccJerkMagiqr
fBodyBodyAccJerkMagentropy
fBodyBodyAccJerkMagmaxInds
fBodyBodyAccJerkMagmeanFreq
fBodyBodyAccJerkMagskewness
fBodyBodyAccJerkMagkurtosis
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroMagmad
fBodyBodyGyroMagmax
fBodyBodyGyroMagmin
fBodyBodyGyroMagsma
fBodyBodyGyroMagenergy
fBodyBodyGyroMagiqr
fBodyBodyGyroMagentropy
fBodyBodyGyroMagmaxInds
fBodyBodyGyroMagmeanFreq
fBodyBodyGyroMagskewness
fBodyBodyGyroMagkurtosis
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
fBodyBodyGyroJerkMagmad
fBodyBodyGyroJerkMagmax
fBodyBodyGyroJerkMagmin
fBodyBodyGyroJerkMagsma
fBodyBodyGyroJerkMagenergy
fBodyBodyGyroJerkMagiqr
fBodyBodyGyroJerkMagentropy
fBodyBodyGyroJerkMagmaxInds
fBodyBodyGyroJerkMagmeanFreq
fBodyBodyGyroJerkMagskewness
fBodyBodyGyroJerkMagkurtosis
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.



