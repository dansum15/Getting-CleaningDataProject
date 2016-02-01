# Getting and Cleaning Data Project 1

This is the Read Me file for the Getting and Cleaning Data Coursera project.

##Overview

This project is designed to give you a real world example of how to get data and clean it. This specific project is about tidying data related to wearable computing. More details about the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data specifically can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Project Summary
The code in this repo does the following:
1. Clears the workspace of all variables
2. Downloads the data if it does not current exist
3. Imports the datasets from the .zip file
4. Renames the columns to something more readable and clear
5. Combines the test dataset with the training dataset
6. Selects only the fields that relate to the mean and standard deviation
7. Renames the columns to better describe the fields
8. Creates a tidy, summarized dataset based on the average of each field for each subject and activity


