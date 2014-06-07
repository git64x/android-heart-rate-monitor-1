android-heart-rate-monitor
==========================
![heart rate](https://raw.githubusercontent.com/joeyvanderbie/android-heart-rate-monitor/master/screenshots/heartrate_small.png "Heart rate")

Android heart rate monitor and Processing heart rate receiver

## Introduction

Android based heart rate monitor which uses the camera and its flash to determine the users heart rate in beats per minute and send via UDP.
A Processing patch is provided to receive the data send.

* Created by Joey van der Bie
* Github: http://github.com/joeyvanderbie/android-heart-rate-monitor

The original android-heart-rate-monitor info:
* Created by Justin Wetherell
* Github: http://github.com/phishman3579/android-heart-rate-monitor

## Details
The App uses the PreviewCallback mechanism to grab the latest image from the preview frame. It then processes the YUV420SP data and pulls out all the red pixel values.

It uses data smoothing in a Integer array to figure out the average red pixel value in the image. Once it figures out the average it determines a heart beat when the average red pixel value in the latest image is greater than the smoothed average.

The App will collect data in ten second chunks and add the beets per minute to another Integer array which is used to smooth the beats per minute data.

If you provide an ip adres and port the app will send your heart beat to the provided Processing patch.

## How To

Open the HeartRateMonitor App and hold the tip of your index finger over the camera lens of your phone. The entire camera preview image should be red with a lighter area where the tip of your finger is touching. Do not press too hard or you will cut off circulation which will result in an inaccurate reading.  

After ten seconds it will compute your heart rate. It'll take between ten and thirty seconds to get an accurate heart rate.

If you provide an IP adres and port the app will send your heart beat to the provided Processing patch (default port is 6000)

To use the Processing patch:
- download Processing 2.0 from processing.org
- copy the udp folder to the library folder of Processing
- open de HeartRate_udp.pd patch in Processing

Screenshots
-----------------------------------------
![start](https://raw.githubusercontent.com/joeyvanderbie/android-heart-rate-monitor/master/screenshots/blank_small.png "Start")
![heart rate](https://raw.githubusercontent.com/joeyvanderbie/android-heart-rate-monitor/master/screenshots/heartrate_small.png "Heart rate")
![udp](https://raw.githubusercontent.com/joeyvanderbie/android-heart-rate-monitor/master/screenshots/udp_small.png "UDP")
