# SETI demo
## Introduction
In these Notebooks, we will use the famous SETI Dataset to build a Convolutional Neural Networks capable to perform signals classification. CNN will say, with some associated error, what type of signal is the presented input. In this notebook, you will use IBM PowerAI with multiple GPU to train the model.
## Project overview:

Each night, using the Allen Telescope Array (ATA) in northern California, the SETI Institute scans the sky at various radio frequencies, observing star systems with known exoplanets, searching for faint but persistent signals. The current signal detection system is programmed to search only for particular kinds of signals: narrow-band carrier waves. However, the detection system sometimes triggers on signals that are not narrow-band signals (with unknown efficiency) and are also not explicitly-known radio frequency interference (RFI). There seems to be various categories of these kinds of events that have been observed in the past.

Our goal is to classify these accurately in real-time. This may allow the signal detection system to make better observational decisions, increase the efficiency of the nightly scans, and allow for explicit detection of these other signal types.

For more information refer to SETI hackathon page.

This repository includes 3 parts:

    Preparing dataset

    Converting images to binary files using Spark
    Converting images to binary files using Numpy

    Classification

    Classification of images using CCN on Single GPU
    Classification of images using CCN on Multi GPU

    Prediction

## SETI_img_to_binary_spark.ipynb
Signal to Binary Files (Train&Test) using Spark

In this notebook we read the Basic 4 dataset through Spark, and convert signals into a binary file.

## SETI_img_to-binary.ipynb
Signal to Binary Files (Train&Test)

In this notebook we read the Basic 4 dataset and convert signals into a binary file. The format of output binary file is same as MNIST.

## SETI_CNN_Tf_SingleGpu.ipynb
SETI Signal Classification on PowerAI with Single GPU

In this Notebook, we will use the famous SETI Dataset to build a Convolutional Neural Networks capable to perform signals classification. CNN will say, with some associated error, what type of signal is the presented input. In our case, as we are running this notebook on IBM PowerAI, you hvae access to multi GPU, but we use one of the GPUs in this notebook, for the sake of simplicity.

## SETI_CNN_Tf_MultiGpu.ipynb
SETI Signal Classification on PowerAI with Multi GPU

In this Notebook, we will use the famous SETI Dataset to build a Convolutional Neural Networks capable to perform signals classification. CNN will say, with some associated error, what type of signal is the presented input. In this notebook, you will use IBM PowerAI with multiple GPU to train the model.

## SETI_prediction.ipynb

In this notebook you can load a pre-trained model and predict the signal class.

## Performance

Convolutional Neural Network involves a lot of matrix and vector multiplications that can parallelized, so GPUs can overperform, because GPUs were designed to handle these kind of matrix operations in parallel!

## Why GPU overperforms?

A single core CPU takes a matrix operation in serial, one element at a time. But, a single GPU could have hundreds or thousands of cores, while a CPU typically has no more than a few cores.

## How to use GPU with TensorFlow?

It is important to notice that if both CPU and GPU are available on the machine that you are running the noebook, and if a TensorFlow operation has both CPU and GPU implementations, the GPU devices will be given priority when the operation is assigned to a device.

## Benchmark:

    SETI_single_gpu_train.py achieves ~72% accuracy after 3k epochs of data (75K steps).
    Speed: With batch_size 128.
    Notice: The model is not optimized to reach to its highest accuracy, you can achive better results tuning the parameters.


<table>
    <tr> <th>CPU Architecture</th> 	<th>CPU cores </th> <th>	Memory  </th>	<th>GPU </th> 	<th>Step time (sec/batch) </th> 	<th> Accuracy</th> </tr>
<tr> <th>POWER8 </th>	<th>40</th> 	<th>256 GB </th>	<th>1 x Tesla K80</th> 	<th>~0.127 </th>	<th>~72% at 75K steps (3 hours)</th> </tr>
    <tr> <th>POWER8</th> 	<th>32</th> 	<th>128 GB</th> 	<th>1 x Tesla P100 w/NVLink np8g4</th> 	<th>~0.035</th> 	<th>~72% at 75K steps (1 hour)</th></tr>
</table>

    SETI_multi_gpu_train.py achieves ~72% accuracy after 75K steps.
    Speed: With batch_size 128.
    Notice: The model is not optimized to reach to highest accuracy, and you can achive better results tuning the parameters.

<table>
    <tr> <th>CPU Architecture</th> 	<th>CPU cores </th> <th>	Memory  </th>	<th>GPU </th> 	<th>Step time (sec/batch) </th> 	<th> Accuracy</th> </tr>
    <tr><th>POWER8</th> 	<th>160</th> 	<th>1 TB</th> 	<th>4 x Tesla K80</th> 	<th>~0.066</th> 	<th>~72% at 75K steps (83 minutes) </th> </tr>
<tr><th>POWER8</th> 	<th>64</th> 	<th>256 GB</th> 	<th>2 x Tesla P100 w/NVLink np8g4</th> 	<th>~0.033</th> 	<th>~72% at 75K steps (40 minutes)</th> </tr>
<tr><th>POWER8</th> 	<th>128</th> 	<th>512 GB</th> 	<th>4 x Tesla P100 w/NVLink np8g4</th> 	<th>~0.017</th> 	<th>~72% at 75K steps (20 minutes)</th></tr>
</table>
