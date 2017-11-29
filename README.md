# SETI demo
## Introduction
In these Notebooks, we will use the famous SETI Dataset to build a Convolutional Neural Networks capable to perform signals classification. CNN will say, with some associated error, what type of signal is the presented input. In this notebook, you will use IBM PowerAI with multiple GPU to train the model.
## Project overview:
Each night, using the Allen Telescope Array (ATA) in northern California, the SETI Institute scans the sky at various radio frequencies, observing star systems with known exoplanets, searching for faint but persistent signals. The current signal detection system is programmed to search only for particular kinds of signals: narrow-band carrier waves. However, the detection system sometimes triggers on signals that are not narrow-band signals (with unknown efficiency) and are also not explicitly-known radio frequency interference (RFI). There seems to be various categories of these kinds of events that have been observed in the past.
The goal of SETI is to classify these signals accurately in real-time. This may allow the signal detection system to make better observational decisions, increase the efficiency of the nightly scans, and allow for explicit detection of these other signal types.
For more information refer to SETI hackathon page.
## Formulating the problem as image classification:
Framing the radio signal data into spectrogram (a 2D visual representation), we can convert the problem into something akin to an image classification problem. Therefore we can run Convolutional Neural Network (CNN), will be run on the images which are the result of converting the signals to spectrogram.
## Training on Multi-GPU:
Running the CNN on large amound of data might take long time to train the model. Howerve, today, many systems contains Multiple GPUs for high performance computation. We can leverage this environments to run the training operation concurrently across multiple cards. One sample of these kind of environments is IBM PowerAI. In this notebook, we show you how to design and run your model on multiple GPUs.
