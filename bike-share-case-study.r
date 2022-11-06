{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "97a084c0",
   "metadata": {
    "papermill": {
     "duration": 0.01089,
     "end_time": "2022-11-06T09:17:54.185166",
     "exception": false,
     "start_time": "2022-11-06T09:17:54.174276",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Case Study 1: How Does a Bike-Share Navigate Speedy Success?**\n",
    "\n",
    "**Introduction**\n",
    "\n",
    "This is my capsotone case study for the Foofle Data Analytics Professional Certificate. I'm Using R notebook for the 6 phase of analysis process.(Ask, Prepare, Process, Analyze, Share and Act)\n",
    "\n",
    "**Scenario**\n",
    "\n",
    "I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members.\n",
    "\n",
    "**About the company**\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share oering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, The director of marketing believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, she believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.\n",
    "\n",
    "### **Ask**\n",
    "\n",
    "**Identify the business task:**\n",
    "\n",
    "Three questions will guide the future marketing program:\n",
    "\n",
    "* How do annual members and casual riders use Cyclistic bikes differently?\n",
    "* Why would casual riders buy Cyclistic annual memberships?\n",
    "* How can Cyclistic use digital media to influence casual riders to become members?\n",
    "\n",
    "\n",
    "### **Prepare**\n",
    "\n",
    "The data used in this analysis is made available to the public and located [here](https://divvy-tripdata.s3.amazonaws.com/index.html)\n",
    "Note: The datasets have a different name because Cyclistic is a fictional company. For the purposes of this case study,the datasets are appropriate and will enable you to answer the business questions. These data were in “.csv” format divided by months. Based on the requirement of the project activity, I downloaded the data for the months from January 2021 to September 2022.\n",
    "\n",
    "### **Process**\n",
    "\n",
    "For the analysis, I will be use R. \n",
    "I will start by installing and loading required R packages to do data cleaning, manipulation and vizualization for my analysis\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "1416115b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:17:54.207833Z",
     "iopub.status.busy": "2022-11-06T09:17:54.205908Z",
     "iopub.status.idle": "2022-11-06T09:17:55.756720Z",
     "shell.execute_reply": "2022-11-06T09:17:55.754948Z"
    },
    "papermill": {
     "duration": 1.564794,
     "end_time": "2022-11-06T09:17:55.759381",
     "exception": false,
     "start_time": "2022-11-06T09:17:54.194587",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "#package for data wrangling\n",
    "library(lubridate)\n",
    "#for date formats\n",
    "library(ggplot2)\n",
    "#for visualizing the data\n",
    "library(dplyr)\n",
    "#for cleaning the data\n",
    "library(tidyr)\n",
    "#for cleaning the data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "77b41845",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:17:55.811894Z",
     "iopub.status.busy": "2022-11-06T09:17:55.782411Z",
     "iopub.status.idle": "2022-11-06T09:19:42.938743Z",
     "shell.execute_reply": "2022-11-06T09:19:42.936930Z"
    },
    "papermill": {
     "duration": 107.172359,
     "end_time": "2022-11-06T09:19:42.942204",
     "exception": false,
     "start_time": "2022-11-06T09:17:55.769845",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#loading data from local strorage\n",
    "#I use the monthy data from august 2021 - july 2022\n",
    "aug_21 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202108-divvy-tripdata.csv\")\n",
    "sep_21 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202109-divvy-tripdata.csv\")\n",
    "oct_21 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202110-divvy-tripdata.csv\")\n",
    "nov_21 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202111-divvy-tripdata.csv\")\n",
    "dec_21 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202112-divvy-tripdata.csv\")\n",
    "jan_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202201-divvy-tripdata.csv\")\n",
    "feb_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202202-divvy-tripdata.csv\")\n",
    "mar_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202203-divvy-tripdata.csv\")\n",
    "apr_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202204-divvy-tripdata.csv\")\n",
    "may_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202205-divvy-tripdata.csv\")\n",
    "jun_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202206-divvy-tripdata.csv\")\n",
    "jul_22 <- read.csv(\"../input/cyclistic-trips-202108-to-202207/202207-divvy-tripdata.csv\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "09154e37",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:19:42.968513Z",
     "iopub.status.busy": "2022-11-06T09:19:42.967051Z",
     "iopub.status.idle": "2022-11-06T09:20:17.175860Z",
     "shell.execute_reply": "2022-11-06T09:20:17.174099Z"
    },
    "papermill": {
     "duration": 34.224178,
     "end_time": "2022-11-06T09:20:17.179219",
     "exception": false,
     "start_time": "2022-11-06T09:19:42.955041",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#merged all the dataset\n",
    "\n",
    "trip_data <- rbind(aug_21, \n",
    "                   sep_21,\n",
    "                   oct_21,\n",
    "                   nov_21,\n",
    "                   dec_21,\n",
    "                   jan_22,\n",
    "                   feb_22,\n",
    "                   mar_22,\n",
    "                   apr_22,\n",
    "                   may_22,\n",
    "                   jun_22,\n",
    "                   jul_22)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "1654dd76",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:17.203441Z",
     "iopub.status.busy": "2022-11-06T09:20:17.201941Z",
     "iopub.status.idle": "2022-11-06T09:20:17.234060Z",
     "shell.execute_reply": "2022-11-06T09:20:17.232412Z"
    },
    "papermill": {
     "duration": 0.04674,
     "end_time": "2022-11-06T09:20:17.236352",
     "exception": false,
     "start_time": "2022-11-06T09:20:17.189612",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>99103BB87CC6C1BB</td><td>electric_bike</td><td>2021-08-10 17:15:49</td><td>2021-08-10 17:22:44</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.68</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>EAFCCCFB0A3FC5A1</td><td>electric_bike</td><td>2021-08-10 17:23:14</td><td>2021-08-10 17:39:24</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.63</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>9EF4F46C57AD234D</td><td>electric_bike</td><td>2021-08-21 02:34:23</td><td>2021-08-21 02:50:36</td><td></td><td></td><td></td><td></td><td>41.95</td><td>-87.65</td><td>41.97</td><td>-87.66</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>5834D3208BFAF1DA</td><td>electric_bike</td><td>2021-08-21 06:52:55</td><td>2021-08-21 07:08:13</td><td></td><td></td><td></td><td></td><td>41.97</td><td>-87.67</td><td>41.95</td><td>-87.65</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>CD825CB87ED1D096</td><td>electric_bike</td><td>2021-08-19 11:55:29</td><td>2021-08-19 12:04:11</td><td></td><td></td><td></td><td></td><td>41.79</td><td>-87.60</td><td>41.77</td><td>-87.62</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>612F12C94A964F3E</td><td>electric_bike</td><td>2021-08-19 12:41:12</td><td>2021-08-19 12:47:47</td><td></td><td></td><td></td><td></td><td>41.81</td><td>-87.61</td><td>41.80</td><td>-87.60</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 99103BB87CC6C1BB & electric\\_bike & 2021-08-10 17:15:49 & 2021-08-10 17:22:44 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.68 & member\\\\\n",
       "\t2 & EAFCCCFB0A3FC5A1 & electric\\_bike & 2021-08-10 17:23:14 & 2021-08-10 17:39:24 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.63 & member\\\\\n",
       "\t3 & 9EF4F46C57AD234D & electric\\_bike & 2021-08-21 02:34:23 & 2021-08-21 02:50:36 &  &  &  &  & 41.95 & -87.65 & 41.97 & -87.66 & member\\\\\n",
       "\t4 & 5834D3208BFAF1DA & electric\\_bike & 2021-08-21 06:52:55 & 2021-08-21 07:08:13 &  &  &  &  & 41.97 & -87.67 & 41.95 & -87.65 & member\\\\\n",
       "\t5 & CD825CB87ED1D096 & electric\\_bike & 2021-08-19 11:55:29 & 2021-08-19 12:04:11 &  &  &  &  & 41.79 & -87.60 & 41.77 & -87.62 & member\\\\\n",
       "\t6 & 612F12C94A964F3E & electric\\_bike & 2021-08-19 12:41:12 & 2021-08-19 12:47:47 &  &  &  &  & 41.81 & -87.61 & 41.80 & -87.60 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 99103BB87CC6C1BB | electric_bike | 2021-08-10 17:15:49 | 2021-08-10 17:22:44 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.68 | member |\n",
       "| 2 | EAFCCCFB0A3FC5A1 | electric_bike | 2021-08-10 17:23:14 | 2021-08-10 17:39:24 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.63 | member |\n",
       "| 3 | 9EF4F46C57AD234D | electric_bike | 2021-08-21 02:34:23 | 2021-08-21 02:50:36 | <!----> | <!----> | <!----> | <!----> | 41.95 | -87.65 | 41.97 | -87.66 | member |\n",
       "| 4 | 5834D3208BFAF1DA | electric_bike | 2021-08-21 06:52:55 | 2021-08-21 07:08:13 | <!----> | <!----> | <!----> | <!----> | 41.97 | -87.67 | 41.95 | -87.65 | member |\n",
       "| 5 | CD825CB87ED1D096 | electric_bike | 2021-08-19 11:55:29 | 2021-08-19 12:04:11 | <!----> | <!----> | <!----> | <!----> | 41.79 | -87.60 | 41.77 | -87.62 | member |\n",
       "| 6 | 612F12C94A964F3E | electric_bike | 2021-08-19 12:41:12 | 2021-08-19 12:47:47 | <!----> | <!----> | <!----> | <!----> | 41.81 | -87.61 | 41.80 | -87.60 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 99103BB87CC6C1BB electric_bike 2021-08-10 17:15:49 2021-08-10 17:22:44\n",
       "2 EAFCCCFB0A3FC5A1 electric_bike 2021-08-10 17:23:14 2021-08-10 17:39:24\n",
       "3 9EF4F46C57AD234D electric_bike 2021-08-21 02:34:23 2021-08-21 02:50:36\n",
       "4 5834D3208BFAF1DA electric_bike 2021-08-21 06:52:55 2021-08-21 07:08:13\n",
       "5 CD825CB87ED1D096 electric_bike 2021-08-19 11:55:29 2021-08-19 12:04:11\n",
       "6 612F12C94A964F3E electric_bike 2021-08-19 12:41:12 2021-08-19 12:47:47\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1                                                                     41.77    \n",
       "2                                                                     41.77    \n",
       "3                                                                     41.95    \n",
       "4                                                                     41.97    \n",
       "5                                                                     41.79    \n",
       "6                                                                     41.81    \n",
       "  start_lng end_lat end_lng member_casual\n",
       "1 -87.68    41.77   -87.68  member       \n",
       "2 -87.68    41.77   -87.63  member       \n",
       "3 -87.65    41.97   -87.66  member       \n",
       "4 -87.67    41.95   -87.65  member       \n",
       "5 -87.60    41.77   -87.62  member       \n",
       "6 -87.61    41.80   -87.60  member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#cheking combined data\n",
    "head(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "dd2eeb0e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:17.261540Z",
     "iopub.status.busy": "2022-11-06T09:20:17.260042Z",
     "iopub.status.idle": "2022-11-06T09:20:17.292574Z",
     "shell.execute_reply": "2022-11-06T09:20:17.290853Z"
    },
    "papermill": {
     "duration": 0.047798,
     "end_time": "2022-11-06T09:20:17.295312",
     "exception": false,
     "start_time": "2022-11-06T09:20:17.247514",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5901463 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"99103BB87CC6C1BB\" \"EAFCCCFB0A3FC5A1\" \"9EF4F46C57AD234D\" \"5834D3208BFAF1DA\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"2021-08-10 17:15:49\" \"2021-08-10 17:23:14\" \"2021-08-21 02:34:23\" \"2021-08-21 06:52:55\" ...\n",
      " $ ended_at          : chr  \"2021-08-10 17:22:44\" \"2021-08-10 17:39:24\" \"2021-08-21 02:50:36\" \"2021-08-21 07:08:13\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.8 41.8 42 42 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.8 41.8 42 42 41.8 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "\n",
    "str(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "a91501e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:17.319920Z",
     "iopub.status.busy": "2022-11-06T09:20:17.318472Z",
     "iopub.status.idle": "2022-11-06T09:20:18.263108Z",
     "shell.execute_reply": "2022-11-06T09:20:18.261017Z"
    },
    "papermill": {
     "duration": 0.960297,
     "end_time": "2022-11-06T09:20:18.265895",
     "exception": false,
     "start_time": "2022-11-06T09:20:17.305598",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#check duplicates\n",
    "sum(duplicated(trip_data$ride_id))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6dd6d4ce",
   "metadata": {
    "papermill": {
     "duration": 0.010613,
     "end_time": "2022-11-06T09:20:18.287259",
     "exception": false,
     "start_time": "2022-11-06T09:20:18.276646",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There is 0 duplicates in this data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "113bd892",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:18.311673Z",
     "iopub.status.busy": "2022-11-06T09:20:18.309828Z",
     "iopub.status.idle": "2022-11-06T09:20:53.206744Z",
     "shell.execute_reply": "2022-11-06T09:20:53.204946Z"
    },
    "papermill": {
     "duration": 34.912333,
     "end_time": "2022-11-06T09:20:53.209653",
     "exception": false,
     "start_time": "2022-11-06T09:20:18.297320",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#problem in date variable so lets parsing datetime columns\n",
    "trip_data$started_at <- as.POSIXct(trip_data$started_at, \"%Y-%m-%d %H:%M:%S\")\n",
    "trip_data$ended_at <- as.POSIXct(trip_data$ended_at, \"%Y-%m-%d %H:%M:%S\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da70e714",
   "metadata": {
    "papermill": {
     "duration": 0.010944,
     "end_time": "2022-11-06T09:20:53.231621",
     "exception": false,
     "start_time": "2022-11-06T09:20:53.220677",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "0f3d3908",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:53.256942Z",
     "iopub.status.busy": "2022-11-06T09:20:53.255503Z",
     "iopub.status.idle": "2022-11-06T09:20:53.292705Z",
     "shell.execute_reply": "2022-11-06T09:20:53.290714Z"
    },
    "papermill": {
     "duration": 0.053318,
     "end_time": "2022-11-06T09:20:53.295692",
     "exception": false,
     "start_time": "2022-11-06T09:20:53.242374",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5901463 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"99103BB87CC6C1BB\" \"EAFCCCFB0A3FC5A1\" \"9EF4F46C57AD234D\" \"5834D3208BFAF1DA\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : POSIXct, format: \"2021-08-10 17:15:49\" \"2021-08-10 17:23:14\" ...\n",
      " $ ended_at          : POSIXct, format: \"2021-08-10 17:22:44\" \"2021-08-10 17:39:24\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.8 41.8 42 42 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.8 41.8 42 42 41.8 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "str(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "d3f7aa11",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:53.322162Z",
     "iopub.status.busy": "2022-11-06T09:20:53.320600Z",
     "iopub.status.idle": "2022-11-06T09:20:53.533893Z",
     "shell.execute_reply": "2022-11-06T09:20:53.532092Z"
    },
    "papermill": {
     "duration": 0.22853,
     "end_time": "2022-11-06T09:20:53.536429",
     "exception": false,
     "start_time": "2022-11-06T09:20:53.307899",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Calculate the ride time in minutes\n",
    "trip_data <- trip_data %>%\n",
    "    mutate(ride_duration_min = as.numeric(trip_data$ended_at-trip_data$started_at)/60)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "4f8642b7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:53.562829Z",
     "iopub.status.busy": "2022-11-06T09:20:53.561297Z",
     "iopub.status.idle": "2022-11-06T09:20:53.590101Z",
     "shell.execute_reply": "2022-11-06T09:20:53.588398Z"
    },
    "papermill": {
     "duration": 0.045308,
     "end_time": "2022-11-06T09:20:53.592608",
     "exception": false,
     "start_time": "2022-11-06T09:20:53.547300",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 14</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_duration_min</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>99103BB87CC6C1BB</td><td>electric_bike</td><td>2021-08-10 17:15:49</td><td>2021-08-10 17:22:44</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.68</td><td>member</td><td> 6.916667</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>EAFCCCFB0A3FC5A1</td><td>electric_bike</td><td>2021-08-10 17:23:14</td><td>2021-08-10 17:39:24</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.63</td><td>member</td><td>16.166667</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>9EF4F46C57AD234D</td><td>electric_bike</td><td>2021-08-21 02:34:23</td><td>2021-08-21 02:50:36</td><td></td><td></td><td></td><td></td><td>41.95</td><td>-87.65</td><td>41.97</td><td>-87.66</td><td>member</td><td>16.216667</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>5834D3208BFAF1DA</td><td>electric_bike</td><td>2021-08-21 06:52:55</td><td>2021-08-21 07:08:13</td><td></td><td></td><td></td><td></td><td>41.97</td><td>-87.67</td><td>41.95</td><td>-87.65</td><td>member</td><td>15.300000</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>CD825CB87ED1D096</td><td>electric_bike</td><td>2021-08-19 11:55:29</td><td>2021-08-19 12:04:11</td><td></td><td></td><td></td><td></td><td>41.79</td><td>-87.60</td><td>41.77</td><td>-87.62</td><td>member</td><td> 8.700000</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>612F12C94A964F3E</td><td>electric_bike</td><td>2021-08-19 12:41:12</td><td>2021-08-19 12:47:47</td><td></td><td></td><td></td><td></td><td>41.81</td><td>-87.61</td><td>41.80</td><td>-87.60</td><td>member</td><td> 6.583333</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 14\n",
       "\\begin{tabular}{r|llllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_duration\\_min\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 99103BB87CC6C1BB & electric\\_bike & 2021-08-10 17:15:49 & 2021-08-10 17:22:44 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.68 & member &  6.916667\\\\\n",
       "\t2 & EAFCCCFB0A3FC5A1 & electric\\_bike & 2021-08-10 17:23:14 & 2021-08-10 17:39:24 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.63 & member & 16.166667\\\\\n",
       "\t3 & 9EF4F46C57AD234D & electric\\_bike & 2021-08-21 02:34:23 & 2021-08-21 02:50:36 &  &  &  &  & 41.95 & -87.65 & 41.97 & -87.66 & member & 16.216667\\\\\n",
       "\t4 & 5834D3208BFAF1DA & electric\\_bike & 2021-08-21 06:52:55 & 2021-08-21 07:08:13 &  &  &  &  & 41.97 & -87.67 & 41.95 & -87.65 & member & 15.300000\\\\\n",
       "\t5 & CD825CB87ED1D096 & electric\\_bike & 2021-08-19 11:55:29 & 2021-08-19 12:04:11 &  &  &  &  & 41.79 & -87.60 & 41.77 & -87.62 & member &  8.700000\\\\\n",
       "\t6 & 612F12C94A964F3E & electric\\_bike & 2021-08-19 12:41:12 & 2021-08-19 12:47:47 &  &  &  &  & 41.81 & -87.61 & 41.80 & -87.60 & member &  6.583333\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 14\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_duration_min &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 99103BB87CC6C1BB | electric_bike | 2021-08-10 17:15:49 | 2021-08-10 17:22:44 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.68 | member |  6.916667 |\n",
       "| 2 | EAFCCCFB0A3FC5A1 | electric_bike | 2021-08-10 17:23:14 | 2021-08-10 17:39:24 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.63 | member | 16.166667 |\n",
       "| 3 | 9EF4F46C57AD234D | electric_bike | 2021-08-21 02:34:23 | 2021-08-21 02:50:36 | <!----> | <!----> | <!----> | <!----> | 41.95 | -87.65 | 41.97 | -87.66 | member | 16.216667 |\n",
       "| 4 | 5834D3208BFAF1DA | electric_bike | 2021-08-21 06:52:55 | 2021-08-21 07:08:13 | <!----> | <!----> | <!----> | <!----> | 41.97 | -87.67 | 41.95 | -87.65 | member | 15.300000 |\n",
       "| 5 | CD825CB87ED1D096 | electric_bike | 2021-08-19 11:55:29 | 2021-08-19 12:04:11 | <!----> | <!----> | <!----> | <!----> | 41.79 | -87.60 | 41.77 | -87.62 | member |  8.700000 |\n",
       "| 6 | 612F12C94A964F3E | electric_bike | 2021-08-19 12:41:12 | 2021-08-19 12:47:47 | <!----> | <!----> | <!----> | <!----> | 41.81 | -87.61 | 41.80 | -87.60 | member |  6.583333 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 99103BB87CC6C1BB electric_bike 2021-08-10 17:15:49 2021-08-10 17:22:44\n",
       "2 EAFCCCFB0A3FC5A1 electric_bike 2021-08-10 17:23:14 2021-08-10 17:39:24\n",
       "3 9EF4F46C57AD234D electric_bike 2021-08-21 02:34:23 2021-08-21 02:50:36\n",
       "4 5834D3208BFAF1DA electric_bike 2021-08-21 06:52:55 2021-08-21 07:08:13\n",
       "5 CD825CB87ED1D096 electric_bike 2021-08-19 11:55:29 2021-08-19 12:04:11\n",
       "6 612F12C94A964F3E electric_bike 2021-08-19 12:41:12 2021-08-19 12:47:47\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1                                                                     41.77    \n",
       "2                                                                     41.77    \n",
       "3                                                                     41.95    \n",
       "4                                                                     41.97    \n",
       "5                                                                     41.79    \n",
       "6                                                                     41.81    \n",
       "  start_lng end_lat end_lng member_casual ride_duration_min\n",
       "1 -87.68    41.77   -87.68  member         6.916667        \n",
       "2 -87.68    41.77   -87.63  member        16.166667        \n",
       "3 -87.65    41.97   -87.66  member        16.216667        \n",
       "4 -87.67    41.95   -87.65  member        15.300000        \n",
       "5 -87.60    41.77   -87.62  member         8.700000        \n",
       "6 -87.61    41.80   -87.60  member         6.583333        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "2f3aad1b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:53.620275Z",
     "iopub.status.busy": "2022-11-06T09:20:53.618700Z",
     "iopub.status.idle": "2022-11-06T09:20:58.133476Z",
     "shell.execute_reply": "2022-11-06T09:20:58.131726Z"
    },
    "papermill": {
     "duration": 4.531988,
     "end_time": "2022-11-06T09:20:58.135880",
     "exception": false,
     "start_time": "2022-11-06T09:20:53.603892",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5901463     Length:5901463     Min.   :2021-08-01 00:00:04  \n",
       " Class :character   Class :character   1st Qu.:2021-09-27 12:35:12  \n",
       " Mode  :character   Mode  :character   Median :2022-02-14 14:10:08  \n",
       "                                       Mean   :2022-01-31 21:50:42  \n",
       "                                       3rd Qu.:2022-06-05 15:29:40  \n",
       "                                       Max.   :2022-07-31 23:59:58  \n",
       "                                                                    \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2021-08-01 00:03:11   Length:5901463     Length:5901463    \n",
       " 1st Qu.:2021-09-27 12:54:02   Class :character   Class :character  \n",
       " Median :2022-02-14 14:20:23   Mode  :character   Mode  :character  \n",
       " Mean   :2022-01-31 22:10:35                                        \n",
       " 3rd Qu.:2022-06-05 15:54:48                                        \n",
       " Max.   :2022-08-04 13:53:01                                        \n",
       "                                                                    \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:5901463     Length:5901463     Min.   :41.64   Min.   :-87.84  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :45.64   Max.   :-73.80  \n",
       "                                                                       \n",
       "    end_lat         end_lng       member_casual      ride_duration_min \n",
       " Min.   :41.39   Min.   :-88.97   Length:5901463     Min.   : -137.42  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character   1st Qu.:    6.17  \n",
       " Median :41.90   Median :-87.64   Mode  :character   Median :   10.95  \n",
       " Mean   :41.90   Mean   :-87.65                      Mean   :   19.89  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                      3rd Qu.:   19.82  \n",
       " Max.   :42.37   Max.   :-87.50                      Max.   :41629.17  \n",
       " NA's   :5590    NA's   :5590                                          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "740f6bc4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:20:58.161262Z",
     "iopub.status.busy": "2022-11-06T09:20:58.159804Z",
     "iopub.status.idle": "2022-11-06T09:21:09.322670Z",
     "shell.execute_reply": "2022-11-06T09:21:09.320738Z"
    },
    "papermill": {
     "duration": 11.178715,
     "end_time": "2022-11-06T09:21:09.325684",
     "exception": false,
     "start_time": "2022-11-06T09:20:58.146969",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#seperate the  column for date, weekday, month and year\n",
    "trip_data$date <- as.Date(trip_data$started_at, \"%Y-%m-%d\")\n",
    "trip_data$year <- format(as.Date(trip_data$started_at),\"%y\")\n",
    "trip_data$month <- format(as.Date(trip_data$date), \"%m\")\n",
    "trip_data$day_of_week <- format(as.Date(trip_data$date),\"%A\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "e7d3b77a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:09.353611Z",
     "iopub.status.busy": "2022-11-06T09:21:09.352056Z",
     "iopub.status.idle": "2022-11-06T09:21:09.385458Z",
     "shell.execute_reply": "2022-11-06T09:21:09.383412Z"
    },
    "papermill": {
     "duration": 0.050357,
     "end_time": "2022-11-06T09:21:09.388365",
     "exception": false,
     "start_time": "2022-11-06T09:21:09.338008",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 18</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_duration_min</th><th scope=col>date</th><th scope=col>year</th><th scope=col>month</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>99103BB87CC6C1BB</td><td>electric_bike</td><td>2021-08-10 17:15:49</td><td>2021-08-10 17:22:44</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.68</td><td>member</td><td> 6.916667</td><td>2021-08-10</td><td>21</td><td>08</td><td>Tuesday </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>EAFCCCFB0A3FC5A1</td><td>electric_bike</td><td>2021-08-10 17:23:14</td><td>2021-08-10 17:39:24</td><td></td><td></td><td></td><td></td><td>41.77</td><td>-87.68</td><td>41.77</td><td>-87.63</td><td>member</td><td>16.166667</td><td>2021-08-10</td><td>21</td><td>08</td><td>Tuesday </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>9EF4F46C57AD234D</td><td>electric_bike</td><td>2021-08-21 02:34:23</td><td>2021-08-21 02:50:36</td><td></td><td></td><td></td><td></td><td>41.95</td><td>-87.65</td><td>41.97</td><td>-87.66</td><td>member</td><td>16.216667</td><td>2021-08-21</td><td>21</td><td>08</td><td>Saturday</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>5834D3208BFAF1DA</td><td>electric_bike</td><td>2021-08-21 06:52:55</td><td>2021-08-21 07:08:13</td><td></td><td></td><td></td><td></td><td>41.97</td><td>-87.67</td><td>41.95</td><td>-87.65</td><td>member</td><td>15.300000</td><td>2021-08-21</td><td>21</td><td>08</td><td>Saturday</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>CD825CB87ED1D096</td><td>electric_bike</td><td>2021-08-19 11:55:29</td><td>2021-08-19 12:04:11</td><td></td><td></td><td></td><td></td><td>41.79</td><td>-87.60</td><td>41.77</td><td>-87.62</td><td>member</td><td> 8.700000</td><td>2021-08-19</td><td>21</td><td>08</td><td>Thursday</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>612F12C94A964F3E</td><td>electric_bike</td><td>2021-08-19 12:41:12</td><td>2021-08-19 12:47:47</td><td></td><td></td><td></td><td></td><td>41.81</td><td>-87.61</td><td>41.80</td><td>-87.60</td><td>member</td><td> 6.583333</td><td>2021-08-19</td><td>21</td><td>08</td><td>Thursday</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 18\n",
       "\\begin{tabular}{r|llllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_duration\\_min & date & year & month & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <dbl> & <date> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 99103BB87CC6C1BB & electric\\_bike & 2021-08-10 17:15:49 & 2021-08-10 17:22:44 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.68 & member &  6.916667 & 2021-08-10 & 21 & 08 & Tuesday \\\\\n",
       "\t2 & EAFCCCFB0A3FC5A1 & electric\\_bike & 2021-08-10 17:23:14 & 2021-08-10 17:39:24 &  &  &  &  & 41.77 & -87.68 & 41.77 & -87.63 & member & 16.166667 & 2021-08-10 & 21 & 08 & Tuesday \\\\\n",
       "\t3 & 9EF4F46C57AD234D & electric\\_bike & 2021-08-21 02:34:23 & 2021-08-21 02:50:36 &  &  &  &  & 41.95 & -87.65 & 41.97 & -87.66 & member & 16.216667 & 2021-08-21 & 21 & 08 & Saturday\\\\\n",
       "\t4 & 5834D3208BFAF1DA & electric\\_bike & 2021-08-21 06:52:55 & 2021-08-21 07:08:13 &  &  &  &  & 41.97 & -87.67 & 41.95 & -87.65 & member & 15.300000 & 2021-08-21 & 21 & 08 & Saturday\\\\\n",
       "\t5 & CD825CB87ED1D096 & electric\\_bike & 2021-08-19 11:55:29 & 2021-08-19 12:04:11 &  &  &  &  & 41.79 & -87.60 & 41.77 & -87.62 & member &  8.700000 & 2021-08-19 & 21 & 08 & Thursday\\\\\n",
       "\t6 & 612F12C94A964F3E & electric\\_bike & 2021-08-19 12:41:12 & 2021-08-19 12:47:47 &  &  &  &  & 41.81 & -87.61 & 41.80 & -87.60 & member &  6.583333 & 2021-08-19 & 21 & 08 & Thursday\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 18\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_duration_min &lt;dbl&gt; | date &lt;date&gt; | year &lt;chr&gt; | month &lt;chr&gt; | day_of_week &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 99103BB87CC6C1BB | electric_bike | 2021-08-10 17:15:49 | 2021-08-10 17:22:44 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.68 | member |  6.916667 | 2021-08-10 | 21 | 08 | Tuesday  |\n",
       "| 2 | EAFCCCFB0A3FC5A1 | electric_bike | 2021-08-10 17:23:14 | 2021-08-10 17:39:24 | <!----> | <!----> | <!----> | <!----> | 41.77 | -87.68 | 41.77 | -87.63 | member | 16.166667 | 2021-08-10 | 21 | 08 | Tuesday  |\n",
       "| 3 | 9EF4F46C57AD234D | electric_bike | 2021-08-21 02:34:23 | 2021-08-21 02:50:36 | <!----> | <!----> | <!----> | <!----> | 41.95 | -87.65 | 41.97 | -87.66 | member | 16.216667 | 2021-08-21 | 21 | 08 | Saturday |\n",
       "| 4 | 5834D3208BFAF1DA | electric_bike | 2021-08-21 06:52:55 | 2021-08-21 07:08:13 | <!----> | <!----> | <!----> | <!----> | 41.97 | -87.67 | 41.95 | -87.65 | member | 15.300000 | 2021-08-21 | 21 | 08 | Saturday |\n",
       "| 5 | CD825CB87ED1D096 | electric_bike | 2021-08-19 11:55:29 | 2021-08-19 12:04:11 | <!----> | <!----> | <!----> | <!----> | 41.79 | -87.60 | 41.77 | -87.62 | member |  8.700000 | 2021-08-19 | 21 | 08 | Thursday |\n",
       "| 6 | 612F12C94A964F3E | electric_bike | 2021-08-19 12:41:12 | 2021-08-19 12:47:47 | <!----> | <!----> | <!----> | <!----> | 41.81 | -87.61 | 41.80 | -87.60 | member |  6.583333 | 2021-08-19 | 21 | 08 | Thursday |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 99103BB87CC6C1BB electric_bike 2021-08-10 17:15:49 2021-08-10 17:22:44\n",
       "2 EAFCCCFB0A3FC5A1 electric_bike 2021-08-10 17:23:14 2021-08-10 17:39:24\n",
       "3 9EF4F46C57AD234D electric_bike 2021-08-21 02:34:23 2021-08-21 02:50:36\n",
       "4 5834D3208BFAF1DA electric_bike 2021-08-21 06:52:55 2021-08-21 07:08:13\n",
       "5 CD825CB87ED1D096 electric_bike 2021-08-19 11:55:29 2021-08-19 12:04:11\n",
       "6 612F12C94A964F3E electric_bike 2021-08-19 12:41:12 2021-08-19 12:47:47\n",
       "  start_station_name start_station_id end_station_name end_station_id start_lat\n",
       "1                                                                     41.77    \n",
       "2                                                                     41.77    \n",
       "3                                                                     41.95    \n",
       "4                                                                     41.97    \n",
       "5                                                                     41.79    \n",
       "6                                                                     41.81    \n",
       "  start_lng end_lat end_lng member_casual ride_duration_min date       year\n",
       "1 -87.68    41.77   -87.68  member         6.916667         2021-08-10 21  \n",
       "2 -87.68    41.77   -87.63  member        16.166667         2021-08-10 21  \n",
       "3 -87.65    41.97   -87.66  member        16.216667         2021-08-21 21  \n",
       "4 -87.67    41.95   -87.65  member        15.300000         2021-08-21 21  \n",
       "5 -87.60    41.77   -87.62  member         8.700000         2021-08-19 21  \n",
       "6 -87.61    41.80   -87.60  member         6.583333         2021-08-19 21  \n",
       "  month day_of_week\n",
       "1 08    Tuesday    \n",
       "2 08    Tuesday    \n",
       "3 08    Saturday   \n",
       "4 08    Saturday   \n",
       "5 08    Thursday   \n",
       "6 08    Thursday   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(trip_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "f5b0f95b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:09.416544Z",
     "iopub.status.busy": "2022-11-06T09:21:09.414952Z",
     "iopub.status.idle": "2022-11-06T09:21:09.584282Z",
     "shell.execute_reply": "2022-11-06T09:21:09.582437Z"
    },
    "papermill": {
     "duration": 0.18943,
     "end_time": "2022-11-06T09:21:09.589602",
     "exception": false,
     "start_time": "2022-11-06T09:21:09.400172",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Tuesday'</li><li>'Saturday'</li><li>'Thursday'</li><li>'Friday'</li><li>'Wednesday'</li><li>'Sunday'</li><li>'Monday'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Tuesday'\n",
       "\\item 'Saturday'\n",
       "\\item 'Thursday'\n",
       "\\item 'Friday'\n",
       "\\item 'Wednesday'\n",
       "\\item 'Sunday'\n",
       "\\item 'Monday'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Tuesday'\n",
       "2. 'Saturday'\n",
       "3. 'Thursday'\n",
       "4. 'Friday'\n",
       "5. 'Wednesday'\n",
       "6. 'Sunday'\n",
       "7. 'Monday'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Tuesday\"   \"Saturday\"  \"Thursday\"  \"Friday\"    \"Wednesday\" \"Sunday\"   \n",
       "[7] \"Monday\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "unique(trip_data$day_of_week)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "5c0e759c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:09.620696Z",
     "iopub.status.busy": "2022-11-06T09:21:09.618886Z",
     "iopub.status.idle": "2022-11-06T09:21:17.488134Z",
     "shell.execute_reply": "2022-11-06T09:21:17.485503Z"
    },
    "papermill": {
     "duration": 7.888192,
     "end_time": "2022-11-06T09:21:17.492262",
     "exception": false,
     "start_time": "2022-11-06T09:21:09.604070",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Getting the hour of the day also useful for intra day analysis\n",
    "trip_data_n <-  mutate(trip_data, start_hour = strftime(started_at,\"%H\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "50fb6c6f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:17.519945Z",
     "iopub.status.busy": "2022-11-06T09:21:17.518196Z",
     "iopub.status.idle": "2022-11-06T09:21:21.762106Z",
     "shell.execute_reply": "2022-11-06T09:21:21.759626Z"
    },
    "papermill": {
     "duration": 4.261743,
     "end_time": "2022-11-06T09:21:21.765675",
     "exception": false,
     "start_time": "2022-11-06T09:21:17.503932",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5901463     Length:5901463     Min.   :2021-08-01 00:00:04  \n",
       " Class :character   Class :character   1st Qu.:2021-09-27 12:35:12  \n",
       " Mode  :character   Mode  :character   Median :2022-02-14 14:10:08  \n",
       "                                       Mean   :2022-01-31 21:50:42  \n",
       "                                       3rd Qu.:2022-06-05 15:29:40  \n",
       "                                       Max.   :2022-07-31 23:59:58  \n",
       "                                                                    \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2021-08-01 00:03:11   Length:5901463     Length:5901463    \n",
       " 1st Qu.:2021-09-27 12:54:02   Class :character   Class :character  \n",
       " Median :2022-02-14 14:20:23   Mode  :character   Mode  :character  \n",
       " Mean   :2022-01-31 22:10:35                                        \n",
       " 3rd Qu.:2022-06-05 15:54:48                                        \n",
       " Max.   :2022-08-04 13:53:01                                        \n",
       "                                                                    \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:5901463     Length:5901463     Min.   :41.64   Min.   :-87.84  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :45.64   Max.   :-73.80  \n",
       "                                                                       \n",
       "    end_lat         end_lng       member_casual      ride_duration_min \n",
       " Min.   :41.39   Min.   :-88.97   Length:5901463     Min.   : -137.42  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character   1st Qu.:    6.17  \n",
       " Median :41.90   Median :-87.64   Mode  :character   Median :   10.95  \n",
       " Mean   :41.90   Mean   :-87.65                      Mean   :   19.89  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                      3rd Qu.:   19.82  \n",
       " Max.   :42.37   Max.   :-87.50                      Max.   :41629.17  \n",
       " NA's   :5590    NA's   :5590                                          \n",
       "      date                year              month           day_of_week       \n",
       " Min.   :2021-08-01   Length:5901463     Length:5901463     Length:5901463    \n",
       " 1st Qu.:2021-09-27   Class :character   Class :character   Class :character  \n",
       " Median :2022-02-14   Mode  :character   Mode  :character   Mode  :character  \n",
       " Mean   :2022-01-31                                                           \n",
       " 3rd Qu.:2022-06-05                                                           \n",
       " Max.   :2022-07-31                                                           \n",
       "                                                                              \n",
       "  start_hour       \n",
       " Length:5901463    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(trip_data_n)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "b65edd29",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:21.794680Z",
     "iopub.status.busy": "2022-11-06T09:21:21.792799Z",
     "iopub.status.idle": "2022-11-06T09:21:21.925530Z",
     "shell.execute_reply": "2022-11-06T09:21:21.923151Z"
    },
    "papermill": {
     "duration": 0.15057,
     "end_time": "2022-11-06T09:21:21.928534",
     "exception": false,
     "start_time": "2022-11-06T09:21:21.777964",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] FALSE  TRUE\n"
     ]
    }
   ],
   "source": [
    "print(unique(trip_data_n$ride_duration_min<0))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7dacbab6",
   "metadata": {
    "papermill": {
     "duration": 0.011465,
     "end_time": "2022-11-06T09:21:21.951426",
     "exception": false,
     "start_time": "2022-11-06T09:21:21.939961",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "we can see that in ride_duration_min columns having  negative value."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "2c87c25e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:21.977962Z",
     "iopub.status.busy": "2022-11-06T09:21:21.976475Z",
     "iopub.status.idle": "2022-11-06T09:21:27.111486Z",
     "shell.execute_reply": "2022-11-06T09:21:27.109551Z"
    },
    "papermill": {
     "duration": 5.152674,
     "end_time": "2022-11-06T09:21:27.115411",
     "exception": false,
     "start_time": "2022-11-06T09:21:21.962737",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Before removing negative durations, our dataframe had 5901463 rows\"\n",
      "[1] \"After removing negative durations, our data frame had 5900827 rows\"\n"
     ]
    }
   ],
   "source": [
    "#remove the negative values in ride duration\n",
    "print(paste('Before removing negative durations, our dataframe had', nrow(trip_data_n), 'rows'))\n",
    "trip_data_n <- trip_data_n[trip_data_n$ride_duration_min>0,]\n",
    "print(paste('After removing negative durations, our data frame had', nrow(trip_data_n), 'rows'))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "f5b5c6ed",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:27.144305Z",
     "iopub.status.busy": "2022-11-06T09:21:27.142793Z",
     "iopub.status.idle": "2022-11-06T09:21:27.177928Z",
     "shell.execute_reply": "2022-11-06T09:21:27.176016Z"
    },
    "papermill": {
     "duration": 0.053321,
     "end_time": "2022-11-06T09:21:27.181355",
     "exception": false,
     "start_time": "2022-11-06T09:21:27.128034",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,900,827\n",
      "Columns: 19\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"99103BB87CC6C1BB\", \"EAFCCCFB0A3FC5A1\", \"9EF4F46C57…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", …\n",
      "$ started_at         \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-08-10 17:15:49, 2021-08-10 17:23:14, 2021-08-…\n",
      "$ ended_at           \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2021-08-10 17:22:44, 2021-08-10 17:39:24, 2021-08-…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"Clark St & Grace St\", …\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"TA1307000127\", \"\", \"\",…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.77000, 41.77000, 41.95000, 41.97000, 41.79000, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.68000, -87.68000, -87.65000, -87.67000, -87.600…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.77000, 41.77000, 41.97000, 41.95000, 41.77000, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.68000, -87.63000, -87.66000, -87.65000, -87.620…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n",
      "$ ride_duration_min  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 6.916667, 16.166667, 16.216667, 15.300000, 8.700000…\n",
      "$ date               \u001b[3m\u001b[90m<date>\u001b[39m\u001b[23m 2021-08-10, 2021-08-10, 2021-08-21, 2021-08-21, 20…\n",
      "$ year               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"21\", \"21\", \"21\", \"21\", \"21\", \"21\", \"21\", \"21\", \"21…\n",
      "$ month              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"08\", \"08\", \"08\", \"08\", \"08\", \"08\", \"08\", \"08\", \"08…\n",
      "$ day_of_week        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Tuesday\", \"Tuesday\", \"Saturday\", \"Saturday\", \"Thur…\n",
      "$ start_hour         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"17\", \"17\", \"02\", \"06\", \"11\", \"12\", \"12\", \"14\", \"18…\n"
     ]
    }
   ],
   "source": [
    "glimpse(trip_data_n)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "af17ef7b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:27.210740Z",
     "iopub.status.busy": "2022-11-06T09:21:27.209207Z",
     "iopub.status.idle": "2022-11-06T09:21:27.996511Z",
     "shell.execute_reply": "2022-11-06T09:21:27.994345Z"
    },
    "papermill": {
     "duration": 0.804318,
     "end_time": "2022-11-06T09:21:27.998941",
     "exception": false,
     "start_time": "2022-11-06T09:21:27.194623",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trip_data_n$start_hour <- as.numeric(trip_data_n$start_hour)\n",
    "cleaned_data <- trip_data_n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a116244d",
   "metadata": {
    "papermill": {
     "duration": 0.011897,
     "end_time": "2022-11-06T09:21:28.022781",
     "exception": false,
     "start_time": "2022-11-06T09:21:28.010884",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "9337b320",
   "metadata": {
    "papermill": {
     "duration": 0.011745,
     "end_time": "2022-11-06T09:21:28.046107",
     "exception": false,
     "start_time": "2022-11-06T09:21:28.034362",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Analyze\n",
    "\n",
    "Here now I cleaned the data and i will anlayse the processed data for gaining valuable insights."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ac01e431",
   "metadata": {
    "papermill": {
     "duration": 0.011963,
     "end_time": "2022-11-06T09:21:28.069729",
     "exception": false,
     "start_time": "2022-11-06T09:21:28.057766",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "e4e02036",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:28.097029Z",
     "iopub.status.busy": "2022-11-06T09:21:28.095258Z",
     "iopub.status.idle": "2022-11-06T09:21:39.041057Z",
     "shell.execute_reply": "2022-11-06T09:21:39.038488Z"
    },
    "papermill": {
     "duration": 10.963345,
     "end_time": "2022-11-06T09:21:39.044713",
     "exception": false,
     "start_time": "2022-11-06T09:21:28.081368",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type        started_at                 \n",
       " Length:5900827     Length:5900827     Min.   :2021-08-01 00:00:04  \n",
       " Class :character   Class :character   1st Qu.:2021-09-27 12:36:11  \n",
       " Mode  :character   Mode  :character   Median :2022-02-14 14:27:20  \n",
       "                                       Mean   :2022-01-31 21:55:21  \n",
       "                                       3rd Qu.:2022-06-05 15:30:41  \n",
       "                                       Max.   :2022-07-31 23:59:58  \n",
       "                                                                    \n",
       "    ended_at                   start_station_name start_station_id  \n",
       " Min.   :2021-08-01 00:03:11   Length:5900827     Length:5900827    \n",
       " 1st Qu.:2021-09-27 12:54:58   Class :character   Class :character  \n",
       " Median :2022-02-14 14:40:15   Mode  :character   Mode  :character  \n",
       " Mean   :2022-01-31 22:15:15                                        \n",
       " 3rd Qu.:2022-06-05 15:55:30                                        \n",
       " Max.   :2022-08-04 13:53:01                                        \n",
       "                                                                    \n",
       " end_station_name   end_station_id       start_lat       start_lng     \n",
       " Length:5900827     Length:5900827     Min.   :41.64   Min.   :-87.84  \n",
       " Class :character   Class :character   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Mode  :character   Mode  :character   Median :41.90   Median :-87.64  \n",
       "                                       Mean   :41.90   Mean   :-87.65  \n",
       "                                       3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       "                                       Max.   :45.64   Max.   :-73.80  \n",
       "                                                                       \n",
       "    end_lat         end_lng       member_casual      ride_duration_min \n",
       " Min.   :41.39   Min.   :-88.97   Length:5900827     Min.   :    0.02  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   Class :character   1st Qu.:    6.17  \n",
       " Median :41.90   Median :-87.64   Mode  :character   Median :   10.95  \n",
       " Mean   :41.90   Mean   :-87.65                      Mean   :   19.89  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63                      3rd Qu.:   19.82  \n",
       " Max.   :42.37   Max.   :-87.50                      Max.   :41629.17  \n",
       " NA's   :5590    NA's   :5590                                          \n",
       "      date                year              month           day_of_week       \n",
       " Min.   :2021-08-01   Length:5900827     Length:5900827     Length:5900827    \n",
       " 1st Qu.:2021-09-27   Class :character   Class :character   Class :character  \n",
       " Median :2022-02-14   Mode  :character   Mode  :character   Mode  :character  \n",
       " Mean   :2022-01-31                                                           \n",
       " 3rd Qu.:2022-06-05                                                           \n",
       " Max.   :2022-07-31                                                           \n",
       "                                                                              \n",
       "   start_hour   \n",
       " Min.   : 0.00  \n",
       " 1st Qu.:11.00  \n",
       " Median :15.00  \n",
       " Mean   :14.21  \n",
       " 3rd Qu.:18.00  \n",
       " Max.   :23.00  \n",
       "                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "summary(cleaned_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "2289fa4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:39.075300Z",
     "iopub.status.busy": "2022-11-06T09:21:39.073480Z",
     "iopub.status.idle": "2022-11-06T09:21:43.362062Z",
     "shell.execute_reply": "2022-11-06T09:21:43.360349Z"
    },
    "papermill": {
     "duration": 4.306873,
     "end_time": "2022-11-06T09:21:43.364455",
     "exception": false,
     "start_time": "2022-11-06T09:21:39.057582",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>cleaned_data$member_casual</th><th scope=col>cleaned_data$ride_duration_min</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>29.21599</td></tr>\n",
       "\t<tr><td>member</td><td>12.93354</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " cleaned\\_data\\$member\\_casual & cleaned\\_data\\$ride\\_duration\\_min\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 29.21599\\\\\n",
       "\t member & 12.93354\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| cleaned_data$member_casual &lt;chr&gt; | cleaned_data$ride_duration_min &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 29.21599 |\n",
       "| member | 12.93354 |\n",
       "\n"
      ],
      "text/plain": [
       "  cleaned_data$member_casual cleaned_data$ride_duration_min\n",
       "1 casual                     29.21599                      \n",
       "2 member                     12.93354                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#cheking the average duration of causual vs  member\n",
    "aggregate(cleaned_data$ride_duration_min ~ cleaned_data$member_casual, FUN=mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "362fcbba",
   "metadata": {
    "papermill": {
     "duration": 0.012883,
     "end_time": "2022-11-06T09:21:43.390669",
     "exception": false,
     "start_time": "2022-11-06T09:21:43.377786",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can see that the average duration of casual members is longer than annual member."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "e1cf34d3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:43.420084Z",
     "iopub.status.busy": "2022-11-06T09:21:43.418560Z",
     "iopub.status.idle": "2022-11-06T09:21:45.032208Z",
     "shell.execute_reply": "2022-11-06T09:21:45.030112Z"
    },
    "papermill": {
     "duration": 1.631435,
     "end_time": "2022-11-06T09:21:45.034945",
     "exception": false,
     "start_time": "2022-11-06T09:21:43.403510",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 12 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>month</th><th scope=col>count</th><th scope=col>member_casual_%</th><th scope=col>member_p</th><th scope=col>casual_p</th><th scope=col>member_casual_diff_%</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01</td><td>103765</td><td> 1.758482</td><td>82.15487</td><td>17.84513</td><td>64.309738</td></tr>\n",
       "\t<tr><td>02</td><td>115604</td><td> 1.959115</td><td>81.47642</td><td>18.52358</td><td>62.952839</td></tr>\n",
       "\t<tr><td>03</td><td>284024</td><td> 4.813291</td><td>68.35690</td><td>31.64310</td><td>36.713799</td></tr>\n",
       "\t<tr><td>04</td><td>371218</td><td> 6.290949</td><td>65.95047</td><td>34.04953</td><td>31.900932</td></tr>\n",
       "\t<tr><td>05</td><td>634810</td><td>10.757984</td><td>55.83135</td><td>44.16865</td><td>11.662702</td></tr>\n",
       "\t<tr><td>06</td><td>769138</td><td>13.034410</td><td>52.02135</td><td>47.97865</td><td> 4.042708</td></tr>\n",
       "\t<tr><td>07</td><td>823416</td><td>13.954247</td><td>50.69163</td><td>49.30837</td><td> 1.383262</td></tr>\n",
       "\t<tr><td>08</td><td>804245</td><td>13.629361</td><td>48.69623</td><td>51.30377</td><td>-2.607539</td></tr>\n",
       "\t<tr><td>09</td><td>756040</td><td>12.812441</td><td>51.87556</td><td>48.12444</td><td> 3.751124</td></tr>\n",
       "\t<tr><td>10</td><td>631156</td><td>10.696060</td><td>59.24890</td><td>40.75110</td><td>18.497804</td></tr>\n",
       "\t<tr><td>11</td><td>359892</td><td> 6.099010</td><td>70.30109</td><td>29.69891</td><td>40.602181</td></tr>\n",
       "\t<tr><td>12</td><td>247519</td><td> 4.194649</td><td>71.82883</td><td>28.17117</td><td>43.657659</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 12 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " month & count & member\\_casual\\_\\% & member\\_p & casual\\_p & member\\_casual\\_diff\\_\\%\\\\\n",
       " <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 01 & 103765 &  1.758482 & 82.15487 & 17.84513 & 64.309738\\\\\n",
       "\t 02 & 115604 &  1.959115 & 81.47642 & 18.52358 & 62.952839\\\\\n",
       "\t 03 & 284024 &  4.813291 & 68.35690 & 31.64310 & 36.713799\\\\\n",
       "\t 04 & 371218 &  6.290949 & 65.95047 & 34.04953 & 31.900932\\\\\n",
       "\t 05 & 634810 & 10.757984 & 55.83135 & 44.16865 & 11.662702\\\\\n",
       "\t 06 & 769138 & 13.034410 & 52.02135 & 47.97865 &  4.042708\\\\\n",
       "\t 07 & 823416 & 13.954247 & 50.69163 & 49.30837 &  1.383262\\\\\n",
       "\t 08 & 804245 & 13.629361 & 48.69623 & 51.30377 & -2.607539\\\\\n",
       "\t 09 & 756040 & 12.812441 & 51.87556 & 48.12444 &  3.751124\\\\\n",
       "\t 10 & 631156 & 10.696060 & 59.24890 & 40.75110 & 18.497804\\\\\n",
       "\t 11 & 359892 &  6.099010 & 70.30109 & 29.69891 & 40.602181\\\\\n",
       "\t 12 & 247519 &  4.194649 & 71.82883 & 28.17117 & 43.657659\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 12 × 6\n",
       "\n",
       "| month &lt;chr&gt; | count &lt;int&gt; | member_casual_% &lt;dbl&gt; | member_p &lt;dbl&gt; | casual_p &lt;dbl&gt; | member_casual_diff_% &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 01 | 103765 |  1.758482 | 82.15487 | 17.84513 | 64.309738 |\n",
       "| 02 | 115604 |  1.959115 | 81.47642 | 18.52358 | 62.952839 |\n",
       "| 03 | 284024 |  4.813291 | 68.35690 | 31.64310 | 36.713799 |\n",
       "| 04 | 371218 |  6.290949 | 65.95047 | 34.04953 | 31.900932 |\n",
       "| 05 | 634810 | 10.757984 | 55.83135 | 44.16865 | 11.662702 |\n",
       "| 06 | 769138 | 13.034410 | 52.02135 | 47.97865 |  4.042708 |\n",
       "| 07 | 823416 | 13.954247 | 50.69163 | 49.30837 |  1.383262 |\n",
       "| 08 | 804245 | 13.629361 | 48.69623 | 51.30377 | -2.607539 |\n",
       "| 09 | 756040 | 12.812441 | 51.87556 | 48.12444 |  3.751124 |\n",
       "| 10 | 631156 | 10.696060 | 59.24890 | 40.75110 | 18.497804 |\n",
       "| 11 | 359892 |  6.099010 | 70.30109 | 29.69891 | 40.602181 |\n",
       "| 12 | 247519 |  4.194649 | 71.82883 | 28.17117 | 43.657659 |\n",
       "\n"
      ],
      "text/plain": [
       "   month count  member_casual_% member_p casual_p member_casual_diff_%\n",
       "1  01    103765  1.758482       82.15487 17.84513 64.309738           \n",
       "2  02    115604  1.959115       81.47642 18.52358 62.952839           \n",
       "3  03    284024  4.813291       68.35690 31.64310 36.713799           \n",
       "4  04    371218  6.290949       65.95047 34.04953 31.900932           \n",
       "5  05    634810 10.757984       55.83135 44.16865 11.662702           \n",
       "6  06    769138 13.034410       52.02135 47.97865  4.042708           \n",
       "7  07    823416 13.954247       50.69163 49.30837  1.383262           \n",
       "8  08    804245 13.629361       48.69623 51.30377 -2.607539           \n",
       "9  09    756040 12.812441       51.87556 48.12444  3.751124           \n",
       "10 10    631156 10.696060       59.24890 40.75110 18.497804           \n",
       "11 11    359892  6.099010       70.30109 29.69891 40.602181           \n",
       "12 12    247519  4.194649       71.82883 28.17117 43.657659           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#data distributed by month\n",
    "cleaned_data%>%\n",
    "    group_by(month)%>%\n",
    "    summarise(count=length(ride_id),\n",
    "    \n",
    "              'member_casual_%'= (length(ride_id)/nrow(cleaned_data)*100),\n",
    "    \n",
    "              'member_p' = (sum(member_casual == 'member')/length(ride_id)*100),\n",
    "       \n",
    "              'casual_p' = (sum(member_casual == 'casual')/length(ride_id)*100),\n",
    "        \n",
    "              'member_casual_diff_%' = member_p - casual_p )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "f3d44565",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:45.065324Z",
     "iopub.status.busy": "2022-11-06T09:21:45.063497Z",
     "iopub.status.idle": "2022-11-06T09:21:45.511291Z",
     "shell.execute_reply": "2022-11-06T09:21:45.509454Z"
    },
    "papermill": {
     "duration": 0.465396,
     "end_time": "2022-11-06T09:21:45.513745",
     "exception": false,
     "start_time": "2022-11-06T09:21:45.048349",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>count</th><th scope=col>percent</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2521889</td><td>43</td></tr>\n",
       "\t<tr><td>member</td><td>3378938</td><td>57</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & count & percent\\\\\n",
       " <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2521889 & 43\\\\\n",
       "\t member & 3378938 & 57\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | count &lt;int&gt; | percent &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | 2521889 | 43 |\n",
       "| member | 3378938 | 57 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual count   percent\n",
       "1 casual        2521889 43     \n",
       "2 member        3378938 57     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#count of casual and annual member\n",
    "Viz_1 <- cleaned_data %>%\n",
    "    group_by(member_casual)%>%\n",
    "    summarise(count = length(ride_id), \n",
    "              \"percent\" = round((length(ride_id)/nrow(cleaned_data))*100))\n",
    "tibble(Viz_1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "ef277bbf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:45.544558Z",
     "iopub.status.busy": "2022-11-06T09:21:45.542898Z",
     "iopub.status.idle": "2022-11-06T09:21:46.215451Z",
     "shell.execute_reply": "2022-11-06T09:21:46.213504Z"
    },
    "papermill": {
     "duration": 0.690498,
     "end_time": "2022-11-06T09:21:46.218121",
     "exception": false,
     "start_time": "2022-11-06T09:21:45.527623",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "ggplot(data=Viz_1, aes(x=\" \", y=count,  fill=member_casual))+\n",
    "    geom_bar(stat=\"identity\", width=1, color=\"white\")+\n",
    "    coord_polar(\"y\", start=0)+\n",
    "    theme(axis.title.x=element_blank(), axis.title.y=element_blank(), axis.text.x=element_blank(), axis.text.y = element_blank(), panel.border=element_blank(), panel.grid=element_blank(), legend.title=element_blank())+\n",
    "    labs(title=\"Total Ride percent: Member vs Casual\", caption=\"Data from: August 2021 - July 2022\")+\n",
    "geom_text(aes(y=count, label=paste0(percent, \"%\")), color='black', position = position_stack(vjust=0.5))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4c962237",
   "metadata": {
    "papermill": {
     "duration": 0.014903,
     "end_time": "2022-11-06T09:21:46.246943",
     "exception": false,
     "start_time": "2022-11-06T09:21:46.232040",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can see that the annual member is 14% more than the casual member."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "9f4af804",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:46.284070Z",
     "iopub.status.busy": "2022-11-06T09:21:46.282481Z",
     "iopub.status.idle": "2022-11-06T09:21:46.970324Z",
     "shell.execute_reply": "2022-11-06T09:21:46.968494Z"
    },
    "papermill": {
     "duration": 0.71173,
     "end_time": "2022-11-06T09:21:46.972933",
     "exception": false,
     "start_time": "2022-11-06T09:21:46.261203",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'month'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 12 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>month</th><th scope=col>year</th><th scope=col>count</th><th scope=col>%</th><th scope=col>members_percent</th><th scope=col>casual_percent</th><th scope=col>Member x Casual Perc Difer</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01</td><td>22</td><td>103765</td><td> 1.758482</td><td>82</td><td>18</td><td>64</td></tr>\n",
       "\t<tr><td>02</td><td>22</td><td>115604</td><td> 1.959115</td><td>81</td><td>19</td><td>62</td></tr>\n",
       "\t<tr><td>03</td><td>22</td><td>284024</td><td> 4.813291</td><td>68</td><td>32</td><td>36</td></tr>\n",
       "\t<tr><td>04</td><td>22</td><td>371218</td><td> 6.290949</td><td>66</td><td>34</td><td>32</td></tr>\n",
       "\t<tr><td>05</td><td>22</td><td>634810</td><td>10.757984</td><td>56</td><td>44</td><td>12</td></tr>\n",
       "\t<tr><td>06</td><td>22</td><td>769138</td><td>13.034410</td><td>52</td><td>48</td><td> 4</td></tr>\n",
       "\t<tr><td>07</td><td>22</td><td>823416</td><td>13.954247</td><td>51</td><td>49</td><td> 2</td></tr>\n",
       "\t<tr><td>08</td><td>21</td><td>804245</td><td>13.629361</td><td>49</td><td>51</td><td>-2</td></tr>\n",
       "\t<tr><td>09</td><td>21</td><td>756040</td><td>12.812441</td><td>52</td><td>48</td><td> 4</td></tr>\n",
       "\t<tr><td>10</td><td>21</td><td>631156</td><td>10.696060</td><td>59</td><td>41</td><td>18</td></tr>\n",
       "\t<tr><td>11</td><td>21</td><td>359892</td><td> 6.099010</td><td>70</td><td>30</td><td>40</td></tr>\n",
       "\t<tr><td>12</td><td>21</td><td>247519</td><td> 4.194649</td><td>72</td><td>28</td><td>44</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 12 × 7\n",
       "\\begin{tabular}{lllllll}\n",
       " month & year & count & \\% & members\\_percent & casual\\_percent & Member x Casual Perc Difer\\\\\n",
       " <chr> & <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 01 & 22 & 103765 &  1.758482 & 82 & 18 & 64\\\\\n",
       "\t 02 & 22 & 115604 &  1.959115 & 81 & 19 & 62\\\\\n",
       "\t 03 & 22 & 284024 &  4.813291 & 68 & 32 & 36\\\\\n",
       "\t 04 & 22 & 371218 &  6.290949 & 66 & 34 & 32\\\\\n",
       "\t 05 & 22 & 634810 & 10.757984 & 56 & 44 & 12\\\\\n",
       "\t 06 & 22 & 769138 & 13.034410 & 52 & 48 &  4\\\\\n",
       "\t 07 & 22 & 823416 & 13.954247 & 51 & 49 &  2\\\\\n",
       "\t 08 & 21 & 804245 & 13.629361 & 49 & 51 & -2\\\\\n",
       "\t 09 & 21 & 756040 & 12.812441 & 52 & 48 &  4\\\\\n",
       "\t 10 & 21 & 631156 & 10.696060 & 59 & 41 & 18\\\\\n",
       "\t 11 & 21 & 359892 &  6.099010 & 70 & 30 & 40\\\\\n",
       "\t 12 & 21 & 247519 &  4.194649 & 72 & 28 & 44\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 12 × 7\n",
       "\n",
       "| month &lt;chr&gt; | year &lt;chr&gt; | count &lt;int&gt; | % &lt;dbl&gt; | members_percent &lt;dbl&gt; | casual_percent &lt;dbl&gt; | Member x Casual Perc Difer &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 01 | 22 | 103765 |  1.758482 | 82 | 18 | 64 |\n",
       "| 02 | 22 | 115604 |  1.959115 | 81 | 19 | 62 |\n",
       "| 03 | 22 | 284024 |  4.813291 | 68 | 32 | 36 |\n",
       "| 04 | 22 | 371218 |  6.290949 | 66 | 34 | 32 |\n",
       "| 05 | 22 | 634810 | 10.757984 | 56 | 44 | 12 |\n",
       "| 06 | 22 | 769138 | 13.034410 | 52 | 48 |  4 |\n",
       "| 07 | 22 | 823416 | 13.954247 | 51 | 49 |  2 |\n",
       "| 08 | 21 | 804245 | 13.629361 | 49 | 51 | -2 |\n",
       "| 09 | 21 | 756040 | 12.812441 | 52 | 48 |  4 |\n",
       "| 10 | 21 | 631156 | 10.696060 | 59 | 41 | 18 |\n",
       "| 11 | 21 | 359892 |  6.099010 | 70 | 30 | 40 |\n",
       "| 12 | 21 | 247519 |  4.194649 | 72 | 28 | 44 |\n",
       "\n"
      ],
      "text/plain": [
       "   month year count  %         members_percent casual_percent\n",
       "1  01    22   103765  1.758482 82              18            \n",
       "2  02    22   115604  1.959115 81              19            \n",
       "3  03    22   284024  4.813291 68              32            \n",
       "4  04    22   371218  6.290949 66              34            \n",
       "5  05    22   634810 10.757984 56              44            \n",
       "6  06    22   769138 13.034410 52              48            \n",
       "7  07    22   823416 13.954247 51              49            \n",
       "8  08    21   804245 13.629361 49              51            \n",
       "9  09    21   756040 12.812441 52              48            \n",
       "10 10    21   631156 10.696060 59              41            \n",
       "11 11    21   359892  6.099010 70              30            \n",
       "12 12    21   247519  4.194649 72              28            \n",
       "   Member x Casual Perc Difer\n",
       "1  64                        \n",
       "2  62                        \n",
       "3  36                        \n",
       "4  32                        \n",
       "5  12                        \n",
       "6   4                        \n",
       "7   2                        \n",
       "8  -2                        \n",
       "9   4                        \n",
       "10 18                        \n",
       "11 40                        \n",
       "12 44                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#summarize data according to month\n",
    "cleaned_data %>%\n",
    "    group_by(month,year) %>%\n",
    "    summarise(count = length(ride_id),\n",
    "              '%' = (length(ride_id) / nrow(cleaned_data)) * 100,\n",
    "              'members_percent' = round((sum(member_casual == \"member\") / length(ride_id)) * 100),\n",
    "              'casual_percent' = round((sum(member_casual == \"casual\") / length(ride_id)) * 100),\n",
    "              'Member x Casual Perc Difer' = members_percent - casual_percent)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "7135fb9c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:21:47.063842Z",
     "iopub.status.busy": "2022-11-06T09:21:47.062306Z",
     "iopub.status.idle": "2022-11-06T09:22:00.024565Z",
     "shell.execute_reply": "2022-11-06T09:22:00.021265Z"
    },
    "papermill": {
     "duration": 13.040291,
     "end_time": "2022-11-06T09:22:00.028742",
     "exception": false,
     "start_time": "2022-11-06T09:21:46.988451",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nvvWtFUJSeezuY16+9tS//PuFd199+hcnX1g7cvzeS9WHELpZ9ervfnnNdbd2v02Xq7rZBQAA\nAADiUPKPxGYqhp950Q8mXvmrC0+/u72iYZnlxhx17skbD64KIaz0tTMPabnkxotPntycrLjm\n5meefmBnfNjVqrfv++Mdk0bst88uC7d7N7sAAAAAQAz640snapdc99jT113AiiS79T7HbL3P\ngvbpYtWmE2946bBzFnr37nYBAAAAgAik7A6z9x6686VVtil3FQAAAABQKv1xh10falhm7TM3\nWqLcVQAAAABAqaQssKtbWloHAAAAwGdZyj4SCwAAAACfbQI7AAAAAIiIwA4AAAAAIiKwAwAA\nAICICOwAAAAAICICOwAAAACIiMAOAAAAACIisAMAAACAiAjsAAAAACAiAjsAAAAAiIjADgAA\nAAAiIrADAAAAgIgI7AAAAAAgIgI7AAAAAIiIwA4AAAAAIiKwAwAAAICICOwAAAAAICICOwAA\nAACIiMAOAAAAACIisAMAAACAiAjsAAAAACAiAjsAAAAAiIjADgAAAAAiIrADAAAAgIjkyl0A\nUFoN55/eh621FNvsuwZnTji57xoDAACAzwJ32AEAAABARAR2AAAAABARgR0AAAAARERgBwAA\nAAAREdgBAAAAQEQEdgAAAAAQEYEdAAAAAEREYAcAAAAAERHYAQAAAEBEBHYAAAAAEBGBHQAA\nAABERGAHAAAAABER2AEAAABARAR2AAAAABARgR0AAAAARERgBwAAAAAREdgBAAAAQEQEdgAA\nAAAQEYEdAAAAAEREYAcAAAAAERHYAQAAAEBEBHYAAAAAEBGBHQAAAABERGAHAAAAABER2AEA\nAABARAR2AAAAABARgR0AAAAARERgBwAAAAAREdgBAAAAQEQEdgAAAAAQEYEdAAAAAEREYAcA\nAAAAERHYAQAAAEBEBHYAAAAAEBGBHQAAAABERGAHAAAAABER2AEAAABARAR2AAAAABARgR0A\nAAAARERgBwAAAAARyZW7AABIq4bzT++rplpCCCFUhVDVRw3OnHByH7UEAAD0N3fYAQAAAEBE\nBHYAAAAAEBGBHQAAAABERGAHAAAAABER2AEAAABARAR2AAAAABARgR0AAAAARCRX7gIAAACA\ndBj+9AvlLqFLH44dXe4SoM+4ww4AAAAAIiKwAwAAAICICOwAAAAAICKeYdelbDbbb11UVFSU\nuq++ks1m46/WxKZIukadompTVGpIVbVKDSFkMpnif+OfjWKpIYRcruS/8OTz+W7W9ttc5XK5\n7iuJQfEynSRJ/G+hTqm4TBff8Oma2D6UrlGnqNoUlRpSVW2KSg2pqrbUv//0zzm2ra2t1F2Q\nCgK7LlVXV/dDZhdCSJJkwIAB/dDRIkqSJIRQXV1dXV1d7lp6JZPJpGJii0o3sa2laLTvzPMa\npajaFJUaUlVtikoNcVdbuhNg8XKQzWZTdI6tra0tdRfNzc1drerP61EqLtPFt1C6LtM1NTU1\nNTXlrqIHaTw2+1C6Rp2ialNUakhVtSkqNaSq2lL//lNRUdEPszF58uRSd0EqCOy6NHv27FIH\n2zU1NXV1dYVCIRUH5NChQ5MkmT17djd/k0SiOLH5fH7KlCnlrqVnw4YNCyGUbmIbStFo35nn\nzZ+ialNUakhVtSkqNcRdbemuLPX19dXV1W1tbdOnTy9RF30lk8kMGTIkhDBjxox++MfqrgKd\nfD4/bdq0UvdevJrMmjWrpaWl1H0totra2tra2o6OjqlTp5a7lh4kSTJ06NCQkomtq6urqalp\nb2/vh/dbhFLx63SnFFWbolJDqqpNUakhVdWWrtSGhoaqqqrW1tYZM2aUqAuYh2fYAQAAAEBE\nBHYAAAAAEBGBHQAAAABERGAHAAAAABER2AEAAABARAR2AAAAABARgR0AAAAARCRX7gIAAOBz\navjTL5S7hO58OHZ0uUsAgM8pd9gBAAAAQEQEdgAAAAAQEYEdAAAAAEREYAcAAAAAERHYAQAA\nAEBEBHYAAAAAEBGBHQAAAABERGAHAAAAABER2AEAAABARAR2AAAAABARgR0AAAAARERgBwAA\nAAAREdgBAAAAQEQEdgAAAAAQEYEdAAAAAEREYAcA8P/s3WeAVNXBBuAz2ysdRQEbKhgrLrYA\nMVGxR6PRqLHXKJrYNbGgwZLEBmpEjYklxkRjw5JoYsPuFzUxNkQUUUSRJp2tM9+PNSsWdhbY\n2TlXnufXzr1zz3nvWZyLL3dmAAAgIgo7AAAAAIiIwg4AAAAAIqKwAwAAAICIKOwAAAAAICIK\nOwAAAACIiMIOAAAAACKisAMAAACAiCjsAAAAAMiJisKC9Q54Kt8p8m9Uv64V3Xdv+/MVdgAA\nAAAQEYUdAAAAAEREYQcAAACwEsjU1zVmoh6wVenGOU0dNlm+KewAAAAAvrFu36BH5zVHvPi7\n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\nWl70Nttss+7du+c7ThYTJ0784IMPOnfuPGjQoHxnyaK+vv7pp58OIWy++eZdu3bNd5ws3nrr\nralTpybrajJo0KDOnTvnO04W48eP/+ijj7p3777ZZpvlO0sWixYtev7550MIW2yxRadOnfId\nJ4s33nhj2rRpPXv23GSTTTpguvj/pk1HyJA/t912W01NzXbbbZfvIG0yZMiQmpqaO++8M99B\nsrvxxhtramp22WWXfAdpky222KKmpua+++7Ld5Dsrr/++pqamj333DPfQbJraGioqampqal5\n+OGH850lu6uuuqqmpmbffffNd5DsFi5c2LywzUVz5C677LKampqDDjoo30Gymz17dvPCPvvs\ns/nOkt1FF11UU1NzxBFH5DtIdtOmTWte2BdffDHfWXKu+UwffPDBfAfJbsyYMTU1NXvttVe+\ng2RXV1fXvLD//Oc/850lu9GjR9fU1Oy///75DpLdvHnzmhf2ySefzHeW7H7zm9/U1NQccsgh\n+Q6S3cyZM5sX9vnnn893luwuuOCCmpqao48+Ot9Bsps6dWrzwr788sv5zpLdueeeW1NTM3z4\n8HwHyW7y5MnNC/vaa6/lO0t2Z555Zk1Nzcknn5zvIKxEvCUWAAAAACKisAMAAACAiCjsAAAA\nACAivnQin2bPnv3JJ58UFhauv/76+c6S3YQJE9LpdK9eveL/CNtZs2ZNnz69qKhovfXWy3eW\n7N56661MJrP66qvH/xG2M2bMmDlzZklJSb9+/fKdJYtMJvPWW2+FEHr37h3/R9hOnz591qxZ\npaWl66yzTr6zZJFOpydMmBBC6NOnT3V1db7jZPHJJ5/Mnj27rKxs7bXXzneWLJqamt5+++0Q\nQt++fauqqvIdJ4tp06Z9+umnFRUVa665Zr6zZNHQ0PDOO++EENZcc82Kiop8x8mt8ePHhxAS\ndDVJ1oueq0n7SuLVpLy8fK211sp3liwaGxsnTpwYQlhjjTUqKyvzHSeLjz/+eM6c/2/vPgOi\nuNYwAH/bC71IEZSqWLASNcZorLFiN0axF1DU2FBJQCH2WBON2FuMPcabmBhjiwU1MRgrisaW\nKIqI9LIs7M79AS6CzECiYWbwfX7B7Dmz75xd93weZmZTMZu8do8ePUpLSzMzM6tevTrfWcqg\n1+vv3LlDRO7u7hqNhu84ZYiPj09PTzc3N69WrRrfWeBNgQU7AAAAAAAAAAAAAcElsQAAAAAA\n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\nCi0vb2UAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 480,
       "width": 840
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "options(repr.plot.width=14, repr.plot.height=8)\n",
    "ggplot(data=cleaned_data, aes(x=month, fill=member_casual))+\n",
    "geom_bar()+\n",
    "labs(title=\"Distribution by Month: Member vs Casual\", caption=\"Data from: August 2021 - July 2022\", x=\"Month\", y=\"Count\")+\n",
    "scale_y_continuous(labels = scales::comma)+\n",
    "facet_wrap(~member_casual)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f579e004",
   "metadata": {
    "papermill": {
     "duration": 0.015158,
     "end_time": "2022-11-06T09:22:00.059465",
     "exception": false,
     "start_time": "2022-11-06T09:22:00.044307",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "In the month from May to october the rider count is  more than other months. So the  all member is love to ride on summer season."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "6b04e126",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:00.094099Z",
     "iopub.status.busy": "2022-11-06T09:22:00.092198Z",
     "iopub.status.idle": "2022-11-06T09:22:00.300919Z",
     "shell.execute_reply": "2022-11-06T09:22:00.298653Z"
    },
    "papermill": {
     "duration": 0.230156,
     "end_time": "2022-11-06T09:22:00.304648",
     "exception": false,
     "start_time": "2022-11-06T09:22:00.074492",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# order the day_of_week \n",
    "cleaned_data$day_of_week <- ordered(cleaned_data$day_of_week, levels=c(\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\", \"Sunday\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "89fb1aee",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:00.340040Z",
     "iopub.status.busy": "2022-11-06T09:22:00.337784Z",
     "iopub.status.idle": "2022-11-06T09:22:01.091172Z",
     "shell.execute_reply": "2022-11-06T09:22:01.088766Z"
    },
    "papermill": {
     "duration": 0.774618,
     "end_time": "2022-11-06T09:22:01.094210",
     "exception": false,
     "start_time": "2022-11-06T09:22:00.319592",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>day_of_week</th><th scope=col>count</th><th scope=col>%</th><th scope=col>members_percent</th><th scope=col>casual_percent</th><th scope=col>Member x Casual Perc Difer</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Monday   </td><td>771985</td><td>13.08266</td><td>61.18759</td><td>38.81241</td><td>22.375176</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>797129</td><td>13.50877</td><td>65.65399</td><td>34.34601</td><td>31.307982</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>804339</td><td>13.63095</td><td>64.97037</td><td>35.02963</td><td>29.940734</td></tr>\n",
       "\t<tr><td>Thursday </td><td>838714</td><td>14.21350</td><td>62.31290</td><td>37.68710</td><td>24.625796</td></tr>\n",
       "\t<tr><td>Friday   </td><td>814246</td><td>13.79885</td><td>57.31032</td><td>42.68968</td><td>14.620643</td></tr>\n",
       "\t<tr><td>Saturday </td><td>980957</td><td>16.62406</td><td>46.22608</td><td>53.77392</td><td>-7.547833</td></tr>\n",
       "\t<tr><td>Sunday   </td><td>893457</td><td>15.14122</td><td>46.77539</td><td>53.22461</td><td>-6.449219</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " day\\_of\\_week & count & \\% & members\\_percent & casual\\_percent & Member x Casual Perc Difer\\\\\n",
       " <ord> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Monday    & 771985 & 13.08266 & 61.18759 & 38.81241 & 22.375176\\\\\n",
       "\t Tuesday   & 797129 & 13.50877 & 65.65399 & 34.34601 & 31.307982\\\\\n",
       "\t Wednesday & 804339 & 13.63095 & 64.97037 & 35.02963 & 29.940734\\\\\n",
       "\t Thursday  & 838714 & 14.21350 & 62.31290 & 37.68710 & 24.625796\\\\\n",
       "\t Friday    & 814246 & 13.79885 & 57.31032 & 42.68968 & 14.620643\\\\\n",
       "\t Saturday  & 980957 & 16.62406 & 46.22608 & 53.77392 & -7.547833\\\\\n",
       "\t Sunday    & 893457 & 15.14122 & 46.77539 & 53.22461 & -6.449219\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 6\n",
       "\n",
       "| day_of_week &lt;ord&gt; | count &lt;int&gt; | % &lt;dbl&gt; | members_percent &lt;dbl&gt; | casual_percent &lt;dbl&gt; | Member x Casual Perc Difer &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| Monday    | 771985 | 13.08266 | 61.18759 | 38.81241 | 22.375176 |\n",
       "| Tuesday   | 797129 | 13.50877 | 65.65399 | 34.34601 | 31.307982 |\n",
       "| Wednesday | 804339 | 13.63095 | 64.97037 | 35.02963 | 29.940734 |\n",
       "| Thursday  | 838714 | 14.21350 | 62.31290 | 37.68710 | 24.625796 |\n",
       "| Friday    | 814246 | 13.79885 | 57.31032 | 42.68968 | 14.620643 |\n",
       "| Saturday  | 980957 | 16.62406 | 46.22608 | 53.77392 | -7.547833 |\n",
       "| Sunday    | 893457 | 15.14122 | 46.77539 | 53.22461 | -6.449219 |\n",
       "\n"
      ],
      "text/plain": [
       "  day_of_week count  %        members_percent casual_percent\n",
       "1 Monday      771985 13.08266 61.18759        38.81241      \n",
       "2 Tuesday     797129 13.50877 65.65399        34.34601      \n",
       "3 Wednesday   804339 13.63095 64.97037        35.02963      \n",
       "4 Thursday    838714 14.21350 62.31290        37.68710      \n",
       "5 Friday      814246 13.79885 57.31032        42.68968      \n",
       "6 Saturday    980957 16.62406 46.22608        53.77392      \n",
       "7 Sunday      893457 15.14122 46.77539        53.22461      \n",
       "  Member x Casual Perc Difer\n",
       "1 22.375176                 \n",
       "2 31.307982                 \n",
       "3 29.940734                 \n",
       "4 24.625796                 \n",
       "5 14.620643                 \n",
       "6 -7.547833                 \n",
       "7 -6.449219                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#summarize data according to day of week\n",
    "cleaned_data %>%\n",
    "    group_by(day_of_week) %>%\n",
    "    summarise(count = length(ride_id),\n",
    "              '%' = (length(ride_id) / nrow(cleaned_data)) * 100,\n",
    "              'members_percent' = (sum(member_casual == \"member\") / length(ride_id)) * 100,\n",
    "              'casual_percent' = (sum(member_casual == \"casual\") / length(ride_id)) * 100,\n",
    "              'Member x Casual Perc Difer' = members_percent - casual_percent)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "3f643de9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:01.127967Z",
     "iopub.status.busy": "2022-11-06T09:22:01.126415Z",
     "iopub.status.idle": "2022-11-06T09:22:12.696467Z",
     "shell.execute_reply": "2022-11-06T09:22:12.694638Z"
    },
    "papermill": {
     "duration": 11.590243,
     "end_time": "2022-11-06T09:22:12.699476",
     "exception": false,
     "start_time": "2022-11-06T09:22:01.109233",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\ndt9om0175qcSIYRmXfceU1Q+/4qKWSGE2mNckp65GSGEh6bMW+zZF7bpEELocfwb1YefDtko\nhND/jUnVhxUl4w/o0by6kg7dNtyga9soirKa97nlqLVrz1J9hr+oes5tOp0un/dFdiIKIWTm\n9y6uXOqI0+n0/Cx0zW49anTu2CYjEYUQokTWIde9Wvvidy7dNoSQSOZttfOeBwzov0G3Nolk\n/sHnnR9CSGa2O+qkU4oqq5arkqWvY3pZljKdTj+06fxcfveXvl/4YZXzOvyyI/v9OWULna3P\nGtXnmnu7FSz07VRROrFPk8wQwuGPj6vPEAAAAACIlR3Qyy269KW/NkkuMIGZTbf49JORR++x\nRdOy754f+fjrH3yR7LDVA++/2T2nwbYJJ7M6vTnuf8POPqJ788ovPvsq0aLjHkec8+bXXxyx\nzq/v8B3w55c/fea2/XfqM2/i6Dff/riwabdDzrjqkwnv7domd7meGZ31j89efeDK3bZYp+jH\nMe/8b2LB2n1OvPSu0aOe7LH0zzBcNt1P7xlCGHvv3g9MXswrFJJZa4z4vzF3XHjcRl3bzhr/\nv/Gzk/0PO/u9cW9t3jyr9mXLPfz6zG0IIZW77pBuLUIInQ+8JXtZ/gMaP/bLGhMmz23Vseve\nR5391Cc/PDR4h9qX9b38tWdvOW+zHi0/fuP559/8JG/tnZ78dMLD114z/Mht8xNTH3/smYpf\nNvcuYyUNv46bnb1O9Rfnb95moVNRIvfS7gUhhJyWey66vbo+a7R865jM7PjPR48NITxy1F5f\nL7hhHAAAAIAVL0qn/VP1WFTMm/7dpKK1unX6TW8IZqV09prNbpow545JhSe2z1MJAAAAACyJ\nABqWTdGUR/LaHJzb+qB5U0aoBAAAAADq0MCvUIBV2Lw5JVkZc/884MwQwqaXXaoSAAAAAKib\nHdBQX6d1aDL8x8IQQk7rrb/94Y12mY32CvWVpxIAAAAAqIPcCuprk122WnedDXY75JxXRr3c\nuJnvylMJAAAAANTBDmgAAAAAAGJh7yQAAAAAALEQQAMAAAAAEAsBNAAAAAAAsRBAAwAAAAAQ\nCwE0AAAAAACxEEADAAAAABALATQAAAAAALEQQAMAAAAAEAsB9NJVVUwfMWzwzpv3bN08P5WV\n167L+gecMuTjqSWNXVcIIdzUpUVuyz3ifsrr+6wVRVEqq9208qpFz878cnAURVEUDRwzPY6n\n5yYTax/8Vhw9AwAAAACxEkAvRfncTwau2+WQwcPGlLTd++Bjjjtkr3VaFT9+++V911z/iQmF\njV3dClVZ9vPgj6cu2v7BxU+u+GIAAAAAgJWfALpO6fLB2+7y9Ldl5/3jvYmfvXbPHbfecd+I\n197/+uvnr0yUfHPM9mc2dn0rVO/8zJcGv7Jwa7rs3Bd/aN6rRWNUBAAAAACs1ATQdfnxjZNu\n+XTaZpe+du2hm9Vu77rrRY/0X33Od3+7edIfaBP0+Ud0mfLBOVMXfAvH7HFXfT6vbP+hvZen\nx3RZaUW6YYqrn6qKWZUr8nkAAAAA8McmgK7LP08ZmUg1/ce5my56aqe/3nnPPfd0rxXGjnnm\ntgHbbdSqWV4qM6ddl/WPPPfWGb+kq1Xl0247/5j1u7TNzsho2rJTvwNPf2/a/FdIn9upadNO\n59bu+bPLN46iaHxpZX16rsPjO3VKJJJvzi6r3Xhqx6aZeevMrUzXUdKSrDvolMqyyYM/mlK7\n8ZPLRmTkrTtk7ea1GwsnvHXmQbus3rp5Vl5Bjw13uPyu52uH1o+s06rZGpd++NezOzbLz8lM\nNl9trcMufLAqhI/uP2/DNdvkZOV37rnZkBGjF3r65/+8Ztv11sjLzGrVocfBZ9wwqayyno+7\nr3vLFl1uKp31wWHb9czPKiisXKGRNwAAAAD8kaUau4CVWfqab2fntT2jS3Zy0XN5Hfofe+yv\nhxOfO6XXgDuadt/2T6edV5BZMfq/Tz54/Rnv/thl7D92DyHcvFvvQa/+vP2Bx+//p05zvv/o\nzrtv2/E/38+c9FRGtPQi6u65DtsPG5DuPfySJ8a/dUy36paSmc/f/mPh2kfc1iQZ3dh/mUvK\nb3dC/4JBLw9+Jbx92C9tlec/M6Hjzk9nJe6uuWzej0/1XueA76MOhx59XNdWyf974/EhJ+7+\n1Dv3ffrAUTXXFE15aKtTZx565iWbdcp65vZrHrrmyK/G/W3Uq0Vnn33xEZXf3XLVX644fJMd\nd5+1VdPM6uunfnLpRo+9s+P+R56zd5P/e/Ofj9w66JW3vv7+4ztzEvV6XFXFjCN795++9eFX\n33p6TqIekw4AAAAANIg0S1BRPC6E0Grdx+tz8QPrtkplrz6hpKKm5awOTXJa7plOp8uLvkpE\n0eq7PlFz6p3BW7Rq1eqRKUXpdHpwxyZNOg6u3dWnQzYKIXz3S1d19JxOp29cq3lOwe6LLamq\n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\nEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0A\nAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAA\nUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAG\nAAAAACAKATQAwP+xd5/xUVUJH4DPpDd6k2ZBEEQEFEWx17Vjw7a6oGJ57b1ir2vvfXWti8jq\n2svasK/uihXBhg1QinRCSJv3QzCikiHEnEQmz/PBn3Pn3jtn/nMyOfkzuQEAACAKBTQAAAAA\nAFEooAEAAAAAiEIBDQAAAABAFApoAAAAAACiUEADAAAAABCFAhoAAAAAgCgU0AAAAAAARKGA\nBgAAAAAgCgU0AAAAAABRKKABAAAAAIhCAQ0AAAAAQBQKaAAAAAAAolBAAwAAAAAQhQIaAAAA\nAIAoFNAAAAAAAEShgAYAAAAAIAoFNAAAAAAAUSigAQAAAACIQgENAAAAAEAUCmgAAAAAAKJQ\nQAMAAAAAEIUCGgAAAACAKBTQAAAAAABEoYAGAAAAACAKBTQAAAAAAFEooAEAAAAAiEIBDQAA\nAABAFApoAAAAAACiUEADAAAAABCFAhoAAAAAgCgU0AAAAAAARKGABgAAAAAgCgU0AAAAAABR\nKKABAAAAAIhCAQ0AAAAAQBQKaAAAAAAAolBAAwAAAAAQhQIaAAAAAIAoFNAAAAAAAEShgAYA\nAAAAIAoFNAAAAAAAUSigAQAAAACIQgENAAAAAEAUCmgAAAAAAKJQQAMAAAAAEIUCGgAAAACA\nKBTQAAAAAABEoYAGAAAAACAKBTQAAAAAAFEooAEAAAAAiEIBDQAAAABAFApoAAAAAACiUEAD\nAAAAABCFAhoAAAAAgCgU0AAAAAAARKGABgAAAAAgCgU0AAAAAABRKKABAAAAAIhCAQ0AAAAA\nQBQKaAAAAAAAolBAAwAAAAAQhQIaAAAAAIAoFNAAAAAAAEShgAYAAAAAIAoFNAAAAAAAUSig\nAQAAAACIQgENAAAAAEAUCmgAAAAAAKJQQAMAAAAAEIUCGgAAAACAKBTQAAAAAABEoYAGAAAA\nACAKBTQAAAAAAFEooAEAAAAAiEIBDQAAAABAFApoAAAAAACiUEADAAAAABCFAhoAAAAAgCgU\n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\nizmL70gu+tUhnXKzqi83UbZg3Il7/2nVtgVtu/Y9e+QH27TKP/rL2akP+frZW3dav3frwty2\nnbvt+n9/nVuR/FVKSypb8NFaffsd2b/tTxsy/tQ+v2TazOLpI8ctKBt+cM+qrQUd9v5Tq7yn\n75tY0/5VN1ba7MzHnn/97ddHL/UFXYaUT6rK28ev3azTEdU3p489MjOr+acLf3GdluV9RikO\nSf1kQQENAAAAsGJb8/+6l8x8qqrePX3jnR6e0vvOx1/83+vPH79t5dn7DfyqpOKqL6ZevXrL\nnsNfnP7N/TXt86tzHvPx5JG92nQb8uysqW9UbfnnITu22PHkV966PYTKowYMuvm1yr/+/bHX\nnx65fcuPDtig32tzF18p+Ordr/q/u1747OM3hjSbeOSma+/xYPLvz73zyqjzxj9xw74Pf1W1\nT37bnY8++ugBRTm/fS5fP3JcSTLn6t1Xad374lXysu49/a1aBJA8cYPN7v2iw/WjXnroppPH\nHL/R63MXpT6gdO5rfXc+Kmx/wtOv/uehG09+9+6zdrzhk1+ltKT8dvu89957A5tlV91cNOut\nkz+btfYxg0pmvxhC2KRFbvWeGzfPnfbytJr2r7qZ17bngAED1l23Ty2eWl30Oe2oBT/c9u9Z\ni0P49wmPtV/v6p75Wb/nGaU4JPWTBQU0AAAAwIotr0PrZDI5qbQihLDqYWfc+eQ1O222Qf/1\nNz787DMrK+a9t6A0J78gL5HIyM4vKMitaZ9fnTMrvyAvI5GRlV9QkFe1Zdpq151z0E69uq00\n96vzb58w68Y3Hv3LrlsP3HzHSx/+7/q504+9/OOq3da99pHDd9yoe++BZ908sLJs+lMP/3VQ\n3x4b7nT0qV2bff/a9Kp9ijofdsMNN2zfKjf8xi0j/tuq54X9CrMTmc2uGNThu6ePW1C5jOvH\nzv32kps+mfPAi38bvPWGWw0e+sgz/7doWYeUzHx2XkXl4Ufuv+GAdbba/cgXHh59Wr82v0qp\nJh89dfOmPbdetM4Rjx7eq7x4TgihS87PlwnpkptZOmtBTfunHlV9Kez4fzu0yjvvgS9DCBWl\nk49/a+rg6wen2H95n1Go+Uk1/JPlj08BDQAAALBiWzR9ViKRqCoNjz/xiMLXH778wrOPHL7/\nVoP2X+r+tdnnt7of2Lvqf6a9MSa7oNfQzoVVNxOZzU7q3uK7h8dV3eyw8eJLMWS3zMvMXXnt\n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"
     },
     "metadata": {
      "image/png": {
       "height": 600,
       "width": 960
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "options(repr.plot.width=16, repr.plot.height=10)\n",
    "ggplot(data=cleaned_data, aes(x=day_of_week,  fill=member_casual))+\n",
    "       geom_bar()+\n",
    "       facet_wrap(~member_casual)+\n",
    "labs(title=\"Number of Ride by Day of Week\", subtitle=\"Casual vs Member\", caption=\"Data from: August 2021-July 2022\", x=\"Day of Week\", y=\"Number of Ride\")+\n",
    "scale_y_continuous(labels = scales::comma)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f1853d8",
   "metadata": {
    "papermill": {
     "duration": 0.016679,
     "end_time": "2022-11-06T09:22:12.732758",
     "exception": false,
     "start_time": "2022-11-06T09:22:12.716079",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can see that the percentage of Casual member is increases in a weekend according to the annual member. but on the weekdays the vice-verse."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a3c5c6b2",
   "metadata": {
    "papermill": {
     "duration": 0.017174,
     "end_time": "2022-11-06T09:22:12.766373",
     "exception": false,
     "start_time": "2022-11-06T09:22:12.749199",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "70c0c53a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:12.803169Z",
     "iopub.status.busy": "2022-11-06T09:22:12.801590Z",
     "iopub.status.idle": "2022-11-06T09:22:14.009983Z",
     "shell.execute_reply": "2022-11-06T09:22:14.007776Z"
    },
    "papermill": {
     "duration": 1.22996,
     "end_time": "2022-11-06T09:22:14.012792",
     "exception": false,
     "start_time": "2022-11-06T09:22:12.782832",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 24 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>start_hour</th><th scope=col>count</th><th scope=col>%</th><th scope=col>members_percent</th><th scope=col>casual_percent</th><th scope=col>Member x Casual Perc Difer</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td> 0</td><td> 87518</td><td>1.4831480</td><td>41.46119</td><td>58.53881</td><td>-17.0776297</td></tr>\n",
       "\t<tr><td> 1</td><td> 57624</td><td>0.9765411</td><td>39.69006</td><td>60.30994</td><td>-20.6198806</td></tr>\n",
       "\t<tr><td> 2</td><td> 35486</td><td>0.6013733</td><td>37.09350</td><td>62.90650</td><td>-25.8129967</td></tr>\n",
       "\t<tr><td> 3</td><td> 20878</td><td>0.3538148</td><td>38.17415</td><td>61.82585</td><td>-23.6516908</td></tr>\n",
       "\t<tr><td> 4</td><td> 18529</td><td>0.3140068</td><td>49.54396</td><td>50.45604</td><td> -0.9120838</td></tr>\n",
       "\t<tr><td> 5</td><td> 47328</td><td>0.8020571</td><td>71.80316</td><td>28.19684</td><td> 43.6063218</td></tr>\n",
       "\t<tr><td> 6</td><td>119246</td><td>2.0208354</td><td>76.13589</td><td>23.86411</td><td> 52.2717743</td></tr>\n",
       "\t<tr><td> 7</td><td>225477</td><td>3.8211085</td><td>76.59717</td><td>23.40283</td><td> 53.1943391</td></tr>\n",
       "\t<tr><td> 8</td><td>273731</td><td>4.6388582</td><td>74.24515</td><td>25.75485</td><td> 48.4903062</td></tr>\n",
       "\t<tr><td> 9</td><td>225798</td><td>3.8265484</td><td>65.15071</td><td>34.84929</td><td> 30.3014199</td></tr>\n",
       "\t<tr><td>10</td><td>245130</td><td>4.1541635</td><td>57.30266</td><td>42.69734</td><td> 14.6053115</td></tr>\n",
       "\t<tr><td>11</td><td>304477</td><td>5.1599039</td><td>55.39302</td><td>44.60698</td><td> 10.7860364</td></tr>\n",
       "\t<tr><td>12</td><td>353605</td><td>5.9924651</td><td>55.03853</td><td>44.96147</td><td> 10.0770634</td></tr>\n",
       "\t<tr><td>13</td><td>359716</td><td>6.0960269</td><td>53.11885</td><td>46.88115</td><td>  6.2376986</td></tr>\n",
       "\t<tr><td>14</td><td>363565</td><td>6.1612550</td><td>51.71840</td><td>48.28160</td><td>  3.4367995</td></tr>\n",
       "\t<tr><td>15</td><td>412302</td><td>6.9871901</td><td>53.58887</td><td>46.41113</td><td>  7.1777483</td></tr>\n",
       "\t<tr><td>16</td><td>499138</td><td>8.4587804</td><td>58.08995</td><td>41.91005</td><td> 16.1798941</td></tr>\n",
       "\t<tr><td>17</td><td>587134</td><td>9.9500290</td><td>59.75893</td><td>40.24107</td><td> 19.5178613</td></tr>\n",
       "\t<tr><td>18</td><td>502548</td><td>8.5165689</td><td>57.60385</td><td>42.39615</td><td> 15.2077016</td></tr>\n",
       "\t<tr><td>19</td><td>371679</td><td>6.2987612</td><td>55.76075</td><td>44.23925</td><td> 11.5215011</td></tr>\n",
       "\t<tr><td>20</td><td>265782</td><td>4.5041483</td><td>54.61243</td><td>45.38757</td><td>  9.2248535</td></tr>\n",
       "\t<tr><td>21</td><td>215105</td><td>3.6453365</td><td>52.05039</td><td>47.94961</td><td>  4.1007880</td></tr>\n",
       "\t<tr><td>22</td><td>180271</td><td>3.0550125</td><td>47.50903</td><td>52.49097</td><td> -4.9819439</td></tr>\n",
       "\t<tr><td>23</td><td>128760</td><td>2.1820670</td><td>44.68546</td><td>55.31454</td><td>-10.6290774</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 24 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " start\\_hour & count & \\% & members\\_percent & casual\\_percent & Member x Casual Perc Difer\\\\\n",
       " <dbl> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t  0 &  87518 & 1.4831480 & 41.46119 & 58.53881 & -17.0776297\\\\\n",
       "\t  1 &  57624 & 0.9765411 & 39.69006 & 60.30994 & -20.6198806\\\\\n",
       "\t  2 &  35486 & 0.6013733 & 37.09350 & 62.90650 & -25.8129967\\\\\n",
       "\t  3 &  20878 & 0.3538148 & 38.17415 & 61.82585 & -23.6516908\\\\\n",
       "\t  4 &  18529 & 0.3140068 & 49.54396 & 50.45604 &  -0.9120838\\\\\n",
       "\t  5 &  47328 & 0.8020571 & 71.80316 & 28.19684 &  43.6063218\\\\\n",
       "\t  6 & 119246 & 2.0208354 & 76.13589 & 23.86411 &  52.2717743\\\\\n",
       "\t  7 & 225477 & 3.8211085 & 76.59717 & 23.40283 &  53.1943391\\\\\n",
       "\t  8 & 273731 & 4.6388582 & 74.24515 & 25.75485 &  48.4903062\\\\\n",
       "\t  9 & 225798 & 3.8265484 & 65.15071 & 34.84929 &  30.3014199\\\\\n",
       "\t 10 & 245130 & 4.1541635 & 57.30266 & 42.69734 &  14.6053115\\\\\n",
       "\t 11 & 304477 & 5.1599039 & 55.39302 & 44.60698 &  10.7860364\\\\\n",
       "\t 12 & 353605 & 5.9924651 & 55.03853 & 44.96147 &  10.0770634\\\\\n",
       "\t 13 & 359716 & 6.0960269 & 53.11885 & 46.88115 &   6.2376986\\\\\n",
       "\t 14 & 363565 & 6.1612550 & 51.71840 & 48.28160 &   3.4367995\\\\\n",
       "\t 15 & 412302 & 6.9871901 & 53.58887 & 46.41113 &   7.1777483\\\\\n",
       "\t 16 & 499138 & 8.4587804 & 58.08995 & 41.91005 &  16.1798941\\\\\n",
       "\t 17 & 587134 & 9.9500290 & 59.75893 & 40.24107 &  19.5178613\\\\\n",
       "\t 18 & 502548 & 8.5165689 & 57.60385 & 42.39615 &  15.2077016\\\\\n",
       "\t 19 & 371679 & 6.2987612 & 55.76075 & 44.23925 &  11.5215011\\\\\n",
       "\t 20 & 265782 & 4.5041483 & 54.61243 & 45.38757 &   9.2248535\\\\\n",
       "\t 21 & 215105 & 3.6453365 & 52.05039 & 47.94961 &   4.1007880\\\\\n",
       "\t 22 & 180271 & 3.0550125 & 47.50903 & 52.49097 &  -4.9819439\\\\\n",
       "\t 23 & 128760 & 2.1820670 & 44.68546 & 55.31454 & -10.6290774\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 24 × 6\n",
       "\n",
       "| start_hour &lt;dbl&gt; | count &lt;int&gt; | % &lt;dbl&gt; | members_percent &lt;dbl&gt; | casual_percent &lt;dbl&gt; | Member x Casual Perc Difer &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "|  0 |  87518 | 1.4831480 | 41.46119 | 58.53881 | -17.0776297 |\n",
       "|  1 |  57624 | 0.9765411 | 39.69006 | 60.30994 | -20.6198806 |\n",
       "|  2 |  35486 | 0.6013733 | 37.09350 | 62.90650 | -25.8129967 |\n",
       "|  3 |  20878 | 0.3538148 | 38.17415 | 61.82585 | -23.6516908 |\n",
       "|  4 |  18529 | 0.3140068 | 49.54396 | 50.45604 |  -0.9120838 |\n",
       "|  5 |  47328 | 0.8020571 | 71.80316 | 28.19684 |  43.6063218 |\n",
       "|  6 | 119246 | 2.0208354 | 76.13589 | 23.86411 |  52.2717743 |\n",
       "|  7 | 225477 | 3.8211085 | 76.59717 | 23.40283 |  53.1943391 |\n",
       "|  8 | 273731 | 4.6388582 | 74.24515 | 25.75485 |  48.4903062 |\n",
       "|  9 | 225798 | 3.8265484 | 65.15071 | 34.84929 |  30.3014199 |\n",
       "| 10 | 245130 | 4.1541635 | 57.30266 | 42.69734 |  14.6053115 |\n",
       "| 11 | 304477 | 5.1599039 | 55.39302 | 44.60698 |  10.7860364 |\n",
       "| 12 | 353605 | 5.9924651 | 55.03853 | 44.96147 |  10.0770634 |\n",
       "| 13 | 359716 | 6.0960269 | 53.11885 | 46.88115 |   6.2376986 |\n",
       "| 14 | 363565 | 6.1612550 | 51.71840 | 48.28160 |   3.4367995 |\n",
       "| 15 | 412302 | 6.9871901 | 53.58887 | 46.41113 |   7.1777483 |\n",
       "| 16 | 499138 | 8.4587804 | 58.08995 | 41.91005 |  16.1798941 |\n",
       "| 17 | 587134 | 9.9500290 | 59.75893 | 40.24107 |  19.5178613 |\n",
       "| 18 | 502548 | 8.5165689 | 57.60385 | 42.39615 |  15.2077016 |\n",
       "| 19 | 371679 | 6.2987612 | 55.76075 | 44.23925 |  11.5215011 |\n",
       "| 20 | 265782 | 4.5041483 | 54.61243 | 45.38757 |   9.2248535 |\n",
       "| 21 | 215105 | 3.6453365 | 52.05039 | 47.94961 |   4.1007880 |\n",
       "| 22 | 180271 | 3.0550125 | 47.50903 | 52.49097 |  -4.9819439 |\n",
       "| 23 | 128760 | 2.1820670 | 44.68546 | 55.31454 | -10.6290774 |\n",
       "\n"
      ],
      "text/plain": [
       "   start_hour count  %         members_percent casual_percent\n",
       "1   0          87518 1.4831480 41.46119        58.53881      \n",
       "2   1          57624 0.9765411 39.69006        60.30994      \n",
       "3   2          35486 0.6013733 37.09350        62.90650      \n",
       "4   3          20878 0.3538148 38.17415        61.82585      \n",
       "5   4          18529 0.3140068 49.54396        50.45604      \n",
       "6   5          47328 0.8020571 71.80316        28.19684      \n",
       "7   6         119246 2.0208354 76.13589        23.86411      \n",
       "8   7         225477 3.8211085 76.59717        23.40283      \n",
       "9   8         273731 4.6388582 74.24515        25.75485      \n",
       "10  9         225798 3.8265484 65.15071        34.84929      \n",
       "11 10         245130 4.1541635 57.30266        42.69734      \n",
       "12 11         304477 5.1599039 55.39302        44.60698      \n",
       "13 12         353605 5.9924651 55.03853        44.96147      \n",
       "14 13         359716 6.0960269 53.11885        46.88115      \n",
       "15 14         363565 6.1612550 51.71840        48.28160      \n",
       "16 15         412302 6.9871901 53.58887        46.41113      \n",
       "17 16         499138 8.4587804 58.08995        41.91005      \n",
       "18 17         587134 9.9500290 59.75893        40.24107      \n",
       "19 18         502548 8.5165689 57.60385        42.39615      \n",
       "20 19         371679 6.2987612 55.76075        44.23925      \n",
       "21 20         265782 4.5041483 54.61243        45.38757      \n",
       "22 21         215105 3.6453365 52.05039        47.94961      \n",
       "23 22         180271 3.0550125 47.50903        52.49097      \n",
       "24 23         128760 2.1820670 44.68546        55.31454      \n",
       "   Member x Casual Perc Difer\n",
       "1  -17.0776297               \n",
       "2  -20.6198806               \n",
       "3  -25.8129967               \n",
       "4  -23.6516908               \n",
       "5   -0.9120838               \n",
       "6   43.6063218               \n",
       "7   52.2717743               \n",
       "8   53.1943391               \n",
       "9   48.4903062               \n",
       "10  30.3014199               \n",
       "11  14.6053115               \n",
       "12  10.7860364               \n",
       "13  10.0770634               \n",
       "14   6.2376986               \n",
       "15   3.4367995               \n",
       "16   7.1777483               \n",
       "17  16.1798941               \n",
       "18  19.5178613               \n",
       "19  15.2077016               \n",
       "20  11.5215011               \n",
       "21   9.2248535               \n",
       "22   4.1007880               \n",
       "23  -4.9819439               \n",
       "24 -10.6290774               "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#summarize data according to start hour\n",
    "cleaned_data %>%\n",
    "    group_by(start_hour) %>%\n",
    "    summarise(count = length(ride_id),\n",
    "              '%' = (length(ride_id) / nrow(cleaned_data)) * 100,\n",
    "              'members_percent' = (sum(member_casual == \"member\") / length(ride_id)) * 100,\n",
    "              'casual_percent' = (sum(member_casual == \"casual\") / length(ride_id)) * 100,\n",
    "              'Member x Casual Perc Difer' = members_percent - casual_percent)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "f529fe30",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:14.050405Z",
     "iopub.status.busy": "2022-11-06T09:22:14.048630Z",
     "iopub.status.idle": "2022-11-06T09:22:34.957990Z",
     "shell.execute_reply": "2022-11-06T09:22:34.955952Z"
    },
    "papermill": {
     "duration": 20.930951,
     "end_time": "2022-11-06T09:22:34.960805",
     "exception": false,
     "start_time": "2022-11-06T09:22:14.029854",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAB4AAAASwCAIAAACVUsChAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ4BU1d0H4HNnZvvSFrAgIIoUKYpd7L33FrtGX0tUYgM1auyKUbAFu7EkMZoY\nS0w09hZjbzGW2CsWRDrL9nk/jK4g7LCUwyD7PJ92zr333P85e3fn7I/LnSSbzQYAAAAAAFjY\nUoUuAAAAAACAJZMAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIA\nDQAAAABAFAJoAAAAAACiEEDnM/G9Q5MkSZLkrBfGzXGH/127fpIkg49/YdHUM2y5dkmS/G9G\nw6I53Typ/urxn2++RpfK4qUHnppnt4EVxclsUqlMu45dV9twu/NueKhppp1f/tWQJEm2ffKL\n/Ke+tHenJEnun1izIPXHm9uaifcnSZIp6dbSDo9su3ySJGv95vWFfmoAAAAAKKxMoQv4abho\n+4OP+/K+jpmk0IUsvs7ccLeb35+0zOqbbbV2n7nuvPQKvdulf5jMpoa6b78Y+9rT/3zt6X/e\n9thVb/7pFzErBQAAAAAWEQF0q8wY/89tznn2uXPWK3Qhi6ts3eUfTC4qX/mDFx8pT809pr/k\n+df37Vo+SweNU/468qC9fn3PW7cddcG5+57au0MIodee597cf8Jy/TvFKhsAAAAAiMkjOOau\nvOvelenUiyO3/fu4GYWuZTGVbZpRn80WlQ9sTfo8R0m6/Z6n3310t8oQwu1XvZtr7Lz6jgcd\ndNAWS5cttEIBAAAAgEVIAD13ZZ13vm/4ak0NUw7d7vyF3nm2sXpGXeNC73be66gdV980990i\n23PDpUMIk16fVOhCllCLx3cZAAAAgLZDAN0qG5z3wOZVpd+8fP6hf/skz27P/mJAkiS7v/3t\nzI3ZxslJklR03bO55b1bNkqS5NB3xt1w8m5LVXYoL8lUdlpqw12PfGF8TQiN9/92+NCVe1aW\nFLXvsvy2B5/63mwfi5fNNj0w5pQNB/RqV1rcaanum+9x+D9e//ZH+3zy9J8O3mWT5ZbqVFLe\nsc/gtY46+5r3q2fpJ/fxicd8MGnaJ/fvveGAyuLyP4yrbnlkTU/+ceROG63StWNlcUWHFQat\nd9SZ139R+11u/si2y6cyHUMI1eP/miRJu+WG5Zmi/Jpqm0IIlb0rcy9fO3uNH30IYVP9uOt/\nfcRafXtUlpR06bbiboed9t9JdbP3M9fhtyTP3H5893ZJkvTa6b4fHfL2VesnSdL/kCfmfbh5\n5Jvw0OorbR6/ywAAAACwkAmgWyWV6XLrvceHEP64/64f1SycG5afOWWjwy66u12/dXbebrOq\n2olP33PtZqvsPebQNXc47oppHfputtE62UmfP3DLyA03H/WjA+8+bt1th/3m+c9qVhqwYv3E\nLx+78/qd11jxvIfHNu/w3GUH9d5o/9/f+1RjRbe1Vuk16aPXrj7rF0P6bv3YbI8QqZ3ywoar\n7Hrve41Dt9q+T1mLDwS/4sDVNzng1H88/Ua684pDV+07+d0Xrj7n8AGDdnuruiGE0Guvo045\n6bgQQlF5v1NOOeXEY7ac3ylpvO6Zr0MIa++/wpw3136y76r9Dz/vupffH1vZvV/X1IS7b7hg\n7d6b/Wd6/cy7tX74s8szt923HlWWSr54dETNrPcQX3b+6yGEX5635vyOeg7yT/i8auV3GQAA\nAAAWviwtm/DuISGEzv1vy728YovuIYR+h9zdvMPb16wXQhh03PO5l88cuXIIYbe3xs/cSVPD\npBBCeZc9mlvevXnDEEKSFJ38xxdzLTPGPdurNBNCSBd1vfqxT3KN37x8VVGSJEn6o5qGXMsx\n3SpDCEmSPmzMQ3VN2Ww221j7zZVHDw0hFJWv/GlNQzabnfzhVSWppLhy8HWPvJ87qrF+/NXH\nrBtC6LDS4Y2zVr7UCpWb/epP1Y1NeSbhozv3DyGUdFjrb69/N666qe+esMmyIYTld7ilpTG2\nZEB5UQjh1nHTZ2ltrPvivZcuOGTNEMJS6x5X+305r561eghhmyfG5l7es3+fEEKH3rs++dHk\nXMtnz/1p5fKi3JV834QZrR/+7FoztxetXBVCOOWdCc1HVX/z1xBCede98gx5xoT7QghJkunf\ngp4VRSGENS/8T27/1kx4K6+01n+XAQAAACAGd0DPgyPu/HO3kvS7N+117XuTF7y3ZTe84cL9\nvrtttrTruhcPqAoh9P/F3Udu2jPX2GX1X+yzVHk22/i/6lnu8O254y3XHb1lURJCCKniLkeN\nefqYFTvUV799xH2fhhDuOvDc2qbs//3jwcM2753bP5XpfOQV/zpg6YrJ7193/VfTZ+5q2rTt\nH75gn7K8nxx4/rB7QghH3f/3nQZ3zrUUVfb5zf2PdStJf3r/ET+6+7iV9luqIplZurhbnzVP\nvfGl9Y4c9ea/RhfPqZzGmo8Ouv2DJFV623O3btSrfa6x+zr7PHjn/jPvNk/Dn13+ud3z/LVD\nCHf8+uXm/d++4rwQwqCTTp/rkLPZhv+14NNZ53ChT3hrvssAAAAAEIMAeh4Ut1/vwYs3z2br\nT9rquLrsgvbWc49ZHtrQuWdFCGHwEf1nbuxXlgkh/Ohj4/Yatf2sDanhl60dQvjPZW+F0HTO\nS9+ki7pcstGys+ySZI7es1cI4bYnv5qlhp1/mf8KaKz56KYvp2fKel80dOmZ2zNl/UcN7pJt\nqhn9/vxk8Uuv0HulmfVeoXNZJoTw8u033v78N3M8ZMpnF09uaOq44rnbdimbub37VmOWK0l/\n/2rehj+7vHMbum89ujSVfHb/yQ3ff/fPuuqdJMlcfFi/uQ45XbxsS/8K9PA2PZt3izHhc/0u\nAwAAAEAkgql5M+jovx2wfLspH9+8y9VvLmBXqeI5TH550dy/I7ssXf6jlqohm4YQqsf+r7Hm\no49qGhrrx5emkh9Zd8ybIYQpb02Z+cBOa3TKf666qc81ZrOlnbbNzHb7bJ/Nlg4hfPLmpLkW\nPLtLnn/9vZm9/+E30ybfee52tZPeGr7d7k1zOmTaB++HELqut+6P2pNU+Z5dvpuQeR3+7PLM\nbQghUz7g7L6d6qa9cuHHU0II08aO+fu3Mzqu9OuNOhTP8xS0IMaEz/W7DAAAAACR+ESyeZQq\nveLBkbetPOzhE7Z5/oAPOrTmkOwcA9X5l8wWTSap4hBCkirLZutDCJnSXsOP23uOxy6zTteZ\nX2bm/pF0Ld7pnaSTEEJT3cIZXZIq3+30e9e8qPylKf++a/yMPWa9zTmEkOSeizGnx0hUfZ/a\nz+vw51BGy3Obe7nn+WufvPsDfzz3tdNv3Oi1s68MIWw4+qD8fc6jBZjwFq60VnyXAQAAACAK\nydQ869jv6NsPuGKP37+75143PLTL3Pevn/Hewi3g3nEzhrab5ZbbiW8+HkLoMLB/prR316L0\nhKbqC0aOXChP/C1ut046SWomPtAYQnrWTR8+8XUIodugjgvjPDnpHavKXppa90Z1/R7hxwF0\nZa+BITz0zbMvhbDBjzY9MrEm98WCDz/P3OZe9thmdGnqwY/vOr3pd4+eePuH6aLOY7bqPl+n\nmrMFmfCFfqUBAAAAwALyCI75scu19w2uKPrsgaNPf/br2bdO/7pm5pdjH7pg4Z79zyc9MGtD\n02XD/h1C2GTEgJAUndyvY2PduNOeH/ejfY5Ztfeyyy77t29rwrxIl/Y+cOnyhhnvn/zcLCNt\nmPHuCa+MT1LFJ/ZbmI936JRJhRA+q2mcfVO77sdXFaUmfXDqw7MOYcJ/L3hqcu13LxZ4+Pnm\nNoTw/VM4aif/6+zHR7wwtW6Z9a/oUZKerZv5N08THvtKAwAAAIAFJICeH+nSle69ZZ8Qwp23\nfDBze8fBHUMIzx9x1tf13z0MYeJb9+x40P0L9+wf373fMdc/mTtBU8PE647b+JJ3J5V13WbM\n0KVDCAfedGQIYfQWW97+wpe5/bONU/8wfPMrX/+wtv1eO3cundfT/fryHUMIY7bd+f63v3v6\ncMP0D3+1w6af1zb02OaatdsVLZxRhRBCyD0W++uJtbNvSpf0uGWflbKNM/Za78BnP5+ea5z4\n9j933vS8mXdbwOHnn9ucPc9fO4QwcterQgi7X7bVfA00n9ZM+KK50gAAAABgAQmg51Ov3W8+\nedUuP2rsvf+oXqWZSe/e0Kvb4O1322uzdQYvN3i395KVB1cstJQ2U9JzaNfiKw/fpLxT97XX\nHlxV0fWIy5/OlPa65snbKlJJCKHrmufdfdKWddNe32edbiusus4Wm23QZ5mlDhz9REmH1W59\nauR8nHGFvf50yX6Dayc9v8PALj36r7Hx2gM7dewz6rEvOqy084N/PWBhjStn+WXLQwgf3PjO\nHLdue91De/XvOOndO9bv2aF7v9WH9Fm288DtX2wcfPnBfZr3WZDhz3Vuc3psM6o0ldRPqS+u\nHPKbwT++BhZcayZ8EVxpAAAAALDgBNDzLTnjwevapWeZwOL26736yt0/32G99nUf3X/3HY+/\n8EZ6uQ1uef7JfmULLRZMl/R48sP/jjrhwH4dG9947Z1Up+47HHjik++9ceDKPzwaeJffPPTq\nvVfuueXa0z9768mnX57Wvu++x57/yifPbbt0+XydMzn+j689est52623cvUXbz/z38+q+qx9\n5BnXvvXmXf0X9qfb9fvlgBDCuzfufMvX1bNvTZcsf9t/3r761MNWX2mZSR//9+PJ6W32P+G5\nD59at2PJzLvN9/BbM7chhEz5wLP6dgohrPCzy0uj/ADNfcIXwZUGAAAAAAsuyWazha5hydQw\n/duPxlav2LfHwnxCMIuHE3p1uPSTKVePnXZkt4pC1+JKAwAAAGDxJYCGeVM97vaKpfcp77r3\n9HG3FboWAAAAAFisLeRHKMASbPqUmpKiqb/Z5bgQwlpnnlHocgAAAABgcecOaGitYcu1G/PF\ntBBCWdcNP/j8iWWLPUIdAAAAAPKRoEFrrbn1BgNXXnW7fU985M2HpM8AAAAAMFfugAYAAAAA\nIAp3cQIAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIA\nDQAAAABAFAJoAAAAAACiEEDPXVPDt7eNGrHVugO6dqzMlFQs23uVvY4+6+VvagpdVwghXNq7\nU3nnHWKf5fFdV0ySJFOy7Pj6ptm3TvzfiCRJkiTZ/e1vY5y9PJ3qs89TMXoGAAAAAKISQM9F\n/dRXdh/Ye98Ro96uWWbnfQ45bN+dVu4y446rzh7aa5U7P5lW6OoWqca6r0a8/M3s7S+cftei\nLwYAAAAAWPwJoPPK1o/YeOu/fVB38h+f++y1x264+oqrb7rtseffe+/+81I17x+y6XGFrm+R\nGlJZ/OCIR37cmq076YHPOw7qVIiKAAAAAIDFmgA6ny+e+MXlr45f54zHLtxvnZnbV9r2tNu3\n6Tnlo99dNrYN3QR9yoG9x71w4jezPoVj8ofnvz69bs9zh8xPj9m62obswimudZoaJjUuyvMB\nAAAAQNsmgM7nr0ffncq0/+NJa82+acvrrrnhhhv6zRTGvn3vlbtssnqXDhWZ4rJle69y0ElX\nTPg+XW2qH3/lKYes0nuZ0qKi9p17bP6zXz43/rtHSJ/Uo337HifN3PNrZ6+RJMnHtY2t6TmP\nO7bskUqln5xcN3PjMd3bF1esPLUxm6eklgwcfnRj3dcjXho3c+MrZ95WVDHwrD4dZ26c9slT\nx+29dc+uHUsqqvqvttnZ194/c2h9+8pdOix/xovXndC9Q2VZcbrjUivuf+rvm0J46eaTV+u1\ndFlJ5QoD1jnrtrd+dPbX/zpy48HLVxSXdFmu/z7Hjh5b19jK093Ur3On3pfWTnph/00GVJZU\nTWtcpJE3AAAAALRlmUIXsDjLjvxgcsUyx/YuTc++rWK5bQ499IeXn9139KBdrm7fb+P/G3Zy\nVXHDW/++6/cXH/vsF73f/eP2IYTLthsy/NGvNv3Z4Xv+X48pn750zfVXbvGvTyeOvacomXsR\n+XvOY9NRu2SHjPn1nR8/dUjfXEvNxPuv+mJanwOvbJdOLtlmnkuqXPaIbaqGPzTikfD0/t+3\nNZ5y7yfdt/pbSer65t2mf3HPkJX3+jRZbr+fH7ZSl/R/nrjjrCO3v+eZm1695eDmfarH3brB\nMRP3O+7X6/QoufeqkbeOPOidD3/35qPVJ5xw+oGNH11+/m/POWDNLbaftEH74tz+37xyxup/\neWaLPQ86ced2/3nyr7dfMfyRp9779OVrylKtOl1Tw4SDhmzz7YYHXHDFL8tSrZh0AAAAAGCh\nyNKChhkfhhC6DLyjNTvfMrBLprTnJzUNzS3HL9eurPOO2Wy2vvqdVJL03PbO5k3PjFivS5cu\nt4+rzmazI7q3a9d9xMxdvXrW6iGEj77vKk/P2Wz2khU7llVtP8eSmhqn9Ssv6tDrtOaW1y9a\nK4Rw7RfT8pc0u8d2WSFX0nPHDkoXLz2urjHXPvnjkSGE4W9PGP/WbiGE3d4an81mzxrYuah8\n5WfGz2g+/O4ThoQQzvtgUu7lbf07hxCGPzo293LGt/8IIaRLuj09sSbX8v6fNgsh7PXm+NzL\nXGR84l3vfD+w+huPHBRC2O1vH7fmdDf2rUqSZOvfvjzHoQEAAAAA8XgER4uy2foQQkhaNUV7\nPP3O11+81bPku3uls03Ta7PZbGN1CCFJlRUnYdLbd7302dTc1qEX/fubb775WdeyBew5vyRV\ncenW3ad8ctHL0+pzLaNGv1WxzMGHL1sx3yUNPOkXjXVfD3/xu6dwvH7eLUXl/c/p+8MnEDZU\nv3nuWxP6/+KWoZ1Lmxu3O+PyEMKfr363uaWovP/Fm3XLfV1atX27dKrLoMvW71iSa+m63oYh\nhBkzPWy6ctnDR+3a9/uBZQ649O7ydOpfZzzRytOFpOT3R8zXU6oBAAAAgAUggG5Rpqx3+0yq\ndtKzc9yabZxy3333PfzEZ7mX5R2rqt//16Xnnvp/B/xsy43X6dG581VffPf5hOmSHg+OPCD7\n2W1rL99xhVXW2+/wE669/cHWPMR5rj3P1dAL981m60/5x6chhBnf/Pn3X09f89xTFqSkym5H\nbdWp9OERD+fm4PS/frTc5qPKZrqIaib8szGb/e/otZOZlHTcOIQw+b+Tm3dLZTrP3G0mCSVd\nf0ixk1TRj87bafAes+xfutL2VaXVX/+rlacrrhyyVJFLHQAAAAAWNc+AziM9omf7Mz+97r0Z\nI/uU/Xiipn5+yQ47nL3Cbo99uEmPEMKdJ26+56WPL7faZjtuuu4O629z4jmrjj18y2O+/7i+\njU66ZdzBv7rnnn888dTT/3745j9df+kJx697zxuPbznTfbvNsk2zBMH5e86vY58z12x38ctn\n/iXs/au3r7gwla68ct/e81HSzM7ev/cG1w4fV79f+bjfPjmp9viRQ2fZnCoOIQw+6cbmG5yb\nlXSY/3uQZ39scyYJSaqkladLUhXzfWoAAAAAYL4JoPPZ7zeb/XrPu/Y975kXz9/oR5v+ddqt\nIYRNThoQQqib+tzPLn28x3bXfPKPw5t3uOn7L+qnvfPKm5M6r7rG3ocP3/vw4SGEt/957oDt\nzjj29FffujqX3jbO3PPXL01o/jp/z3OXFI3avdemvz/nreoR517zzlJrXTGwPNO6klo06JQj\nG387bPgL44768/WZspXOXbnTzFtLq7ZLJ8c1TOq39dbrNTc2zPjfnff+Z5lVy1tf+I9MeOOe\nELZsftlY+/Hfv61pP3Tz0qpVYpwOAAAAAFgoPJcgn167/X7f3h1evnDLX97wxMy3Jb919zm7\n3/ZBWZftfrvWUiGEhur/NWazVUPWaN6h+stnRo+dGkI2hDD966vXXXfdvS589Ydu11wrhNAw\nvSGEUJ5O1Uy4b/z3zzuu+fa5ox4b27xn/p5bY/WzD8821Rz9x7PuGT9jtzE75xrzl5RfZbej\nN+9Y+vCIB8+59cNum46uSM1yd3KmdKWzBlS994eDHv3qh6dU33b0zvvss8+nC3CtTfviqlPv\n+/D7V41/Gr7ztMamnS9aP9LpAAAAAICFwh3Q+SSpit+9cO+4Idv/9rBN77h8w+03XL1Dpvbd\nlx+/79l3M2W9b/j3n3Lxa3nXvbfofNTjF+9wTNHwNbqXf/jmczdcc2/vZUrrPnvlilvvOGSv\ns7boet2j52603Yc/X3fgik2TPr7nhhvTRZ3PumC1EMJOB/Q9+7wXV93swJP236z+q//dfMnl\nX3cpDp9/FwTn7/nQffbIV30IIYR2PU/YvOPpjx11QXHlkFGrdc01duh1dp6S5jor5+674vrX\nHPHPptphF64/++bj7r/q+r77bdt70K5777RGn6o3HvvzHx5+d/DBfzhgqfm/Jbmka+mFOw14\nY79D1urd7tXH/3L3kx/32PrcK4cuHel0AAAAAMDCkWVuGmo+vfasX2ywygodKkoyJRXdeq/6\ns6POfvHr6pn3mfbpIwdts85ynSvaL7PiJtvv//c3J3zz0kW9OpUXV3b9vLah+qt/D/vZFj27\ntM+k0u06d994l0PvfnV87sCmxuljTtin3/LLFCVJCGG59Q98+pltQwgf1TS0pudLVuxYVrV9\n/vqfO25QCGHAL56euTFPSbN7bJcVZi5p6meXhRAypStMbWjKtYx/a7cQwm5vfdfDpHceOGKX\njZfpWFlcXtV/yAZnXv/P+qYferutf+eS9uvP3H+nTKrnNg83v5zy6XkhhB1fG5d7WZZKNrr1\nlRvOPGzICsuUZoq79hx8yOnXT274ocf8p7uxb1Vpx83zTxEAAAAAEEOSzbb2YQ5E1VQ75fNv\nGnp2ryp0IQAAAAAAC4cAGgAAAACAKHxSGwAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAA\nAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIA\nDQAAAABAFAJoAAAAAACiyBS6gMXXxIkT6+rqCl0FAABt3dJLL93SpvHjxzc2Ni7KYgAAYHZ5\nlqwC6BZNnz69urq60FUAANDW5VnNT506tb6+flEWAwAAs8uzZPUIDgAAAAAAohBAAwAAAAAQ\nhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgA\nFlM7brH5RWOnFboKAADanJoJ92+66aZf1TcWuhCAJYEAGgAAAACAKATQAAAAwE9OY2NTAQ/P\n23WN/8YH8INMoQsAYLHWOOOjG0Zf86/X3hxfUzxg7S2HjTh8hbJ0CKF24ptXXXLd06++O7k2\n27VH3+0PGr7/xj1DCF+9cO9lN9715idjUxVdB623w6nH7lORTkK2ftPNtjr0z/ftv1R5rtvd\nt9xinZvvOWm5ypb6AQCAOdp9yy22G3nicyMv/2BiQ6dl+xz865F9P7n9/Ovu+7I6tdKaW154\n1lEd0qkQQlPDt7eN+e1jL7352be13futttdhx24zsKr1h4cQJr35wMVj/vDGxxMql+294wHH\nH7xV3zzdhhB23GLzn99621dXXfDIfyvuuuv8Ak0PwGLHHdAAtCzbcPFhw+7/pN0RJ184+tzj\nO31w/7FHXZfbcv2wU54av/yI8y+55rej9lij6aZzf/FlXWPD9NcPPfXysPYev7n8qrOO/dm7\nD9x4yt0f5z/DHPuJPi4AAH7K7vj1X3Y6afQfbhyzUfmXlw879IzHsidffM3lZx786bN3n/Pk\nV7l9fnfs4be/nt1n2GljLjlnpwHh4mP3u2/s9NYfHkI47dRbh+x+1CWXnL/7qkW/v/DI3705\nIX+3IYSnRp1Sue7el405cRFOBsDizh3QALRo6ifXPPRlw6X3nrJqRSaE0PuSyaec+8iEhqaq\nTGqZHfYbsc2u63YsCSH0XG7/MX/91Xs1De2rX6xubNpply0GVJWGvn1Gn1P1eWmH/KeYYz/L\nFqcXwegAAPiJ6nPMOTuu0yOEcMBx/f827MULzz58hdJ0WHHXvbv+7rHXJ4XNus0Y/9fb3p50\nyb2nD6ksCiH0XXlIw793+v2lr28/amhrDs+dpf/wUQds1i2EMHCVtarf3OneUY/ve3E2T7ch\nhInLDjtw29UKMSUAiy8BNAAt+uaZN4or18ylzyGE0s47XHbZDrmvd99zp9eeeer2jz/78ssv\nP/jvs7nGsq57bNn//jN+tu8q66w5eNCgNdfZYL0VqvKfYo79AABAHlWDvrvLIVNZkipaaoXS\n725f6JBOstlsCGHapy9ks03H77jVzEdVNnwWwtDWHJ6z69pdm7/efIfuf7np8WmflufpNoSw\n3NbLL7xRAiwhBNAAtKipPpukimdvb6wfd9pBh/yvYtCOG6+5ytCB2+2x+ZGH/iqEkEp3OPXq\nO/Z748WXXnv9v68+dPsNVwzZ68LfHL7m7D3UZbN5+gEAgFabw8NF0xXFqXTlP/5xRzJza1LU\nysNn31DcrihJ0nPttqL9HE8B0KZ5BjQALeoydMW6qc+/M+O7hzLXTHho9913f2Fa/bRPr3rh\n69obr7ng0P332HzDdZbv9N3HfE94444xV9++/KB1dt//sLN+M+baX/Z/5Z5rm3ub0vDd7SQ1\nE5+c1tgUQmipHwAAWBCV3XbINk3/+7cNpd8puem0EaMf/mKeOrnnlfHNXz/6l08qu2+1ULoF\naGvcAQ1Aizr0/uXQjk/86sRRIw7fuXNm8l2XXllXtvHalUXVM/pnm578y6P/2XW1ZcZ//Pqf\nrr4hhPDJF5OGdKq+8y83T62s2nndfkn12Lvv+bSyx14hhJAUDagoemzUH7c4fpeiKR//YfTo\nVJKEEIraz7mfxvZLewg0AADzrbjdukev2eX6YaeVDdt3YPd2L91/9Z1vjL/w7GXmqZNnLhh+\nW+3Rqy9X9vpDf7j5o+lH37hBcbvKBe8WoK0RQAPQoiRdduZNl1496vox5wSi5G0AACAASURB\nVA6f1FTRZ43tLzv+kBBCede9LzriqytuOPvu6nTv/qsffPbNVRcccssxP1/n73//zVGTr737\nul/eMqWy41J9V9/+0uP3yXV1/sW/POfiW3/587/UNjYN2vbYTSddm7+fvmUiaAAA5t+uI6+t\nuWL0rZee/W19Uc8+Q069/Lw1K+fh+RjpTNXFR21y7S2jbxpX232lvkeec/Puy1cueLcAbdAs\nz9dnZp9//nl1dXWhqwBYomSbaidOzVZ1KC10IQA/JX379m1p00cffVRfX78oiwEAgNnlWbK6\nAxqARSdJlVR1KHQRAAAAwKLiQwgBAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAa\nAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBdIsaGhoKXQIAAOTT1NRU6BIAACCfTKELWHx16tSp\nvr6+0FXMRWlpaWVlZQhh/Pjxha6lYDp16lRdXV1bW1voQgqjvLy8vLy8sbFx4sSJha6lYLp0\n6TJp0qQ2+49GlZWVpaWl9fX1kydPLnQthZFKpaqqqiZMmNBmU5gOHToUFRXV1NRMmzat0LUU\nRiaT6dChw7ffflvoQgqmU6dO6XS6urq6urq60LUURklJSXl5edt8K6yqqmpsbCx0FXNhuRLa\n/HKlXbt2JSUlliuWK5YrliuWK238rTCEMG3atJqamkLXUhhlZWXFxcVt863QHdAAAAAAAEQh\ngAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAA\nAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACi\nEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0A\nAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAA\nUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAG\nAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAA\ngCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIgiU+gCAAAAAKCQur7xTtT+p6yx\nStT+YXHmDmgAAAAAAKJIstlsoWtYTNXV1aVSi3tAn0qlckU2NDQUupaCSafTTU1NbfZKzl0D\n2Wy2sbGx0LUUTCaTaWxsdA208Wugjf8aTJKkqampqamp0LUURpIk6XTaNdDGr4FUKrUE/xrM\nZFr8b4v19fVJkizKYuaDt6rQ5pcruV9TrgFvVW38rcpyZTG/Boqefj5q/w0brrtkL1fmKree\nWZyvgdhSqVSSJEvqNdDU1FRcXNzSVo/gaFFDQ8Pi/yNRVFRUUlISQqipqSl0LQVTXl5eX1/f\nZt/Ii4uLi4uLs9lsW74GKisr6+rqltRf4nNVUlKSSqWampra7DWQJEkmk6mtrW2zf9WXlZWl\n0+nGxsba2tpC11IY6XS6rKyszf4IhBDKy8uTJGloaKirqyt0LYWRyWSKi4uX4GugsrKypU11\ndXWL/28/y5UQQmVlZW1t7eL/90UkpaWlmUzGcsVyxXKlzf4IBMuVEOrr65fs5cpc5dYz9fX1\n9fX1ha6lMIqLi9Pp9JJ6DWSzWQH0/Pip/EgIoMvKyurr69vsOiaVSvmLLvcXXZv9R4hMJlNU\nVNSW/6JLpVIVFRVt+a/6kpKS3F90bfYayGQypaWlbXb4IYSysrIQQkNDQ5udhJKSkqKioiV4\n+PkD6MX/n2AtV8L3/17eZpcrRUVFbTyAtlyxXLFcsVypr69fspcrc9UcQLfZSUiSJEmSJXj4\n7dq1a2nT4v6ICQAAAAAAfqIE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0A\nAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAA\nUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAG\nAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAA\ngCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBA\nAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAA\nAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEI\noAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAA\nAAAgCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAo\nBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMA\nAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABA\nFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKAB\nAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAA\nIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQ\nAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAA\nABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQC\naAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAA\nAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAK\nATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAA\nAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIgiswjOUTfl3Ruu+N0z//2gJl3Rc4UBux9+\n9PrLV4YQQmh64var/v7UK59NTfcftPbBw36+YnlzPXk2hVbs09Km1nQLAAAAAMBCsAjugM5e\ndcIZz4xf5ujTzx952rH90/8bNfzk8fVNIYQP7zz90j8/u+5uh5153IGVHzx62vHXNn1/TJ5N\noRX7tLSpNd0CAAAAALBQRA+gayc//ti46kPPPmro4H59Bq5+yCkjGms/+/M31SFbd8mf3+69\nzzl7bjF04BobHnvRMdO/fPDWsdNDCPk2NZuPw1vTLQAAAAAAC0n0ADqV6XLIIYes0674u9dJ\nJoRQnk7VTn7q05rGLbdcLtdc0nGD1SqLX37iqxBCnk3N5uPw1nQLAAAAAMDCEv0JyEUVq+yy\nyyohhImvPf/Kl1++8uidXQfueMBS5TO+eD2EMKC8qHnPlcszD7w+OewX6qa3uKlZnn1a2lS3\nyVy6ffrpp88444zmrRdffPHqq6++UCZhEejcuXOhSyiYJEkqKysrKysLXUhhJEkSQkin0235\nGgghdOjQodAlFEzuGigqKmrj10CnTp0KXULB5K6B0tLSkpKSQtdSMEmStOUfgdw1UF5eXlZW\nVuhaCqbNXgPt27dPpRb3zxW3XMmxXLFcsVyxXGnLPwK5a6CsrKzNLlcqKyvb+DWQU1FRUVFR\nUegqCmYJvgYaGxvzbF10H8H39dOPPfD+2E8+mTF0t14hhKba6SGEzpkflstditIN02ryb2o2\nH4fPtdv6+vopU6Y0v2xsbMz9fvxJ+AmVGkMbH35OG5+ENj78nDY+CW18+DltfBLa+PBz2vgk\ntM3hJ0nyExr4T6jUGNr48HPa+CS08eHntPFJaOPDD217BnJjb8szkGMGltQZyD+uRRdA9z/m\nVxeHUP3FC0ccc8HZyw44qX9ZCGFiQ1NlOp3b4dv6xnTH4hBCqrjFTc3y7NPSprl227t372HD\nhjW/7Nq16/Tpi/sTojOZTO4fkBf/UuMpKyurr69vaGgodCGFUVxcXFRU1NTUNGPGjELXUjAV\nFRUzZsxoamqjnypaUlKSyWQaGxtramrmvveSKEmS8vLy6urqbDZb6FoKo7S0NJ1ONzQ01NbW\nFrqWwkilUqWlpdXV1YUupGDKy8uTJKmvr6+rqyt0LYWRyWSKioqW4LfCPDcK1dTULP6//SxX\nguWK5YrliuWK5Up5eZIkdXV19fX1ha6lMGpra5fs5cpc5dYztbW1bTbAKSoqSqfTS+pbYTab\nzfNwgugB9JT3//WvD0q233rt3MvybmvvWFV634NfFa0xOISn3pnR0KPkuzj4vRkNHTboGEIo\nqmhxU7M8+7S0aa7d9uzZ86CDDmp+OXny5MX/90Lz/2Ba/EuNp7S0tK6urs2uY5IkKSoqymaz\nbfkaqKioaMvvYel0OpPJtOW/6lOpVHl5eU1NTZv9q764uDj3F12bvQYymUxpaWmbHX74/q/6\n+vr6NjsJuWxrCR5+ngC6trY2/394XBxYroQ2v1zJZDKWK5YrliuWK238Gqirq1uylytzlVvP\n1NfXL6kJbGskSbIEXwN5AujoD4yrn/HkdddcOr7++3fZbOOb1Q3lPctLO27arTj94NPjvttt\n+msvTK1bfYtlQgh5NjWbj8Nb0y0AAAAAAAtL9AC6U/8jehfXnjLydy+/8c77b//nz1eMeG1G\nyf77rxiS4uF79H//5rMeefmdLz9848YzRpcvu/mB3StDCHk2ffjXP950yz3592lxU55DAAAA\nAABY2KI/giNV1PW8S0696to/jT7nwYaidj179T/uwjPW71QSQljpZ+cdVXvZ7Zee8W1N0nvV\njc8757DmOLylTWMf++ffxy/184N2mb/D8xwCAAAAAMDCtSg+hLB8uTWHn7PmHDYk6S0POnHL\ng+awpaVNG15163vHjJzvw/MdAgAAAADAQvUTuwP4q3/f997KWxW6CgAAAAAA5m5R3AG9ELXr\nudp563UrdBUAAAAAAMzdTyyArughfQYAAAAA+Gn4iT2CAwAAAACAnwoBNAAAAAAAUQigAQAA\nAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAK\nATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAA\nAAAARJEpdAEAAAAAMGdd33gnav/fDOoXtX/AHdAAAAAAAEThDmgAAAAAiM7d3LRN7oAGAAAA\nACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE\n0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAA\nAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAU\nAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEA\nAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAg\nCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAA\nAAAAAEQhgAYAAAAAIAoBNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAA\nEIUAGgAAAACAKATQAAAAAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJo\nAAAAAACiEEADAAAAABCFABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAA\nAIhCAA0AAAAAQBQCaAAAAAAAohBAAwAAAAAQhQAaAAAAAIAoBNAAAAAAAEQhgAYAAAAAIAoB\nNAAAAAAAUQigAQAAAACIQgANAAAAAEAUAmgAAAAAAKIQQAMAAAAAEIUAGgAAAACAKATQAAAA\nAABEIYAGAAAAACAKATQAAAAAAFEIoAEAAAAAiEIADQAAAABAFAJoAAAAAACiEEADAAAAABCF\nABoAAAAAgCgE0AAAAAAARCGABgAAAAAgCgE0AAAAAABRCKABAAAAAIhCAA0AAAAAQBQCaADg\n/9m78zi5qjJv4LeWrt6TAAk7OGwmgbDqCIxgREBf1EFFQBRlE9CR4PJiXpFAEgKiEhUERJBF\nnBGVAUcRx5UlIIKMoMgEJUYWQYJDiBiTXqu66v2jxhYDqVSSfmrr7/ePfLruqXvOc2/fqjr5\n5eQWAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAA\nAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBA\nAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAECIVKlUqncN\nDSqfz6fTjR7Qp1KpcpEjIyP1rqVuMplMsVgct1dyOp1OpVKJa2DcXwOlUqlYLNa7lrrJZDLj\n+SXgGih/Go7nayCTySRJ4hpo4Wug/Ct+SYVCoTwTaGSmK4npyrj/qEpMV8b9NdDyH1XrVP4s\n27B3wuxPfhZQ0d8UDtyvBqOMvGb/dDqdWvTT0FHKx9KYNuYaaA2pVCqVSrXq22CxWGxra1tb\na7aWpTSX4eHhxr8m2traOjo6kiTp7++vdy11093dPTQ0VCgU6l1IfbS3t+dyuWKxOJ6vgd7e\n3sHBwXE7mevo6GhraxvP10Aqlerp6RkYGBi385iurq5MJlMoFAYHB+tdS31kMpmurq5x+xJI\nkqS7uzudTufz+aGhoXrXUh/ZbLa9vb2Fr4He3t61NQ0ODjb+u5/pSmK6YrpiumK6Yrry1+nK\n8PBwvWtZU21+L0NDQ+3t7dGjNPI1Vp7PDA8P5/P5etdSH7lcLpPJDAwM1LuQEKVSSQC9IQqF\nQuO/JEYXvIzbv3AmSdLV1VUoFMbtGchkMrlcrlQqjdszkCRJb2/v8PDwuP1HiLa2tvLf6Mbt\nNVD+jyBN8a+GQTo6OsqLqsbtNZDNZjs7O8ft4SdJ0tXVlSTJeP40TJIkl8u18OFXCKDz+Xzj\nZ5qmK8m4n67kcrkkSUxXTFdMV8bt4Sd/na405jVQm5IKhUL5zTBUA57eUeX5zHiesqbT6XQ6\nPT4Pv9FvMQEAAAAAQJMSQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAA\nEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAA\nAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABA\nCAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMA\nAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAh\nBNAAAAAAAIQQQAMAAAAAECJb7wIAgBbXu3BBaP8DH4/tHwAAgA1mBTQAAAAAACEE0AAAAAAA\nhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQA\nAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQ\nQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAA\nAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAI\nATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAA\nAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQIlvvAgAAAABoMlMWLwntf/mM\nqaH9AzVjBTQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAA\nhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQA\nAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQ\nQgANAAAAAECIbL0LAAAYG70LF4T2v2r23ND+AQAAWo8V0AAAAAAAhBBAAwAAAAAQQgANAAAA\nAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhMjW\nuwAAoG56Fy4I7X/V7Lmh/QMAANDgrIAGAAAAACCEABoAAAAAgBACaAAAAAAAQgigAQAAAAAI\nIYAGAAAAACBEtt4FAAAAAABjZsriJaH9L58xNbR/WowV0AAAAAAAhBBAAwAAAAAQQgANAAAA\nAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhMjW\nuwAAAAAYF6YsXhLa//IZU0P7B4ANYAU0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEKIW94AuFZ7/\n1lVXfv+eX60YTG+13S6Hv+f9b9h7yyRJkqS46BuX33LXL55alZk241UnnH7ijl2j9VRoSqp4\nztqaqukWAAAAAIAxUIsV0D+64KPX3/k/h5/4wU+f97HX7TR0+fzTvv3U6iRJHvvm2RfdcO9+\nR5wy78PH9Tx625yPXFn86y4VmpIqnrO2pmq6BQAAAABgTIQH0CNDT13xwHMHnjP3n1+3/y7T\n9nj7aRccOinz7csXJ6Xhz93wm53eueCoQ/bf7RUHfujCWX3P/PD6p/uSJKnUNGoDdq+mWwAA\nAAAAxkh8AD34xMt22OGNO07464bU3hPb839ePbTyricHRw49dJvy1vZJB+zdk3tg0R+TJKnQ\nNGoDdq+mWwAAAAAAxkr4HZBzEw+8+OIDRx/mVz9y7bLVLztx6nDfjUmS7NrVNto0vSv7g4dW\nJscmw30Pra1pVIXnrK1p+LXr6Pbuu++eO3fuaOvChQv32WefjTz8mtlss83qXULdpFKpnp6e\nnp6eehdSH6lUKkmSTCYznq+BJEkmTpxY7xLqpnwNtLW1jfNrYJNNNql3CXVTvgY6Ojra29vX\nd9/hgHpeqHxZRo8yceLEVCq12Wab1eZwGlD5Gujq6urs7Kx3LXVTvgbqXUUdTJgwIZ1u9O8V\nN10pM10xXanBdKVhz/DGTFdaxrj9qNpgNTtdtRmop6en/EII1fgnrbu7u7u7e2yLaSIt/D4w\nMjJSoXX9Auglt93w9R/e++Szf3rNp684pu2e+5btMXPG5tXv/vv7v3fJ56/N73jYnP+zbeH3\nfUmSbJb923R5clumsHowSZLi0FqbRlV4ztqa1tltPp//y1/+MvpwZGSkBm8NY6WJSo0wzg+/\nbJyfhHF++GXj/CSM88Mva8CTUJuSyqPUYKwGPMNraPwKQ43Pw0+lUk104E1UaoRxfvhl4/wk\n+KhKmqHCUOP88NdXzU5XLaesrTHKxgzkVdCqZ6DycVUfQJcuP/GA0667p/yg65xL3rT6koP2\n/u5rTr701itPy67r1A0/v+TaSy/5/i//NPPIf/nEu17XkUqtynUmSfJ8odiTyZSfsyI/kpmU\nS5IkvfamURWes7amdXY7derUs846a/ThlltuuXr16qrPT320tbWV/wG58UuN09XVNTw8XCgU\n6l1IfeRyuVwuVywW+/v7611L3fT09PT39xeL4/RbRdvb29va2kZGRgYGBupdS32kUqnu7u6+\nvr5SqVTvWuqjs7Mzk8nk8/mhoaH13bdt3U/ZKOWPp+hR+vv7Ozs7+/r6anM4DairqyudTg8P\nDw8PR68Cb1DZbDaXy7XwR2GF/+k1MDDQ+O9+pivJuJ+udHR0ZLNZ05W+vvCvIGrYj6qNma60\nhnQ6XZ6u1LuQZlKz67k2Aw0ODuZyuXU/b+M08kkrz2eGhoby+XxARU2gra0tm8226kdhqVTq\n7e1dW2u1AfSj1x9x2nX3HHzaxZ/78FF77rJNkiSb7HLhBaeu+PiVsw7f++Dv/cu0Cvuu+v1t\nZ3z0sszuh1141XFTJ3eUN7Z1754kdy0ZKGzX/r9x8NKBwsQDJlVuGrUBu6+z26233vqII44Y\nfbhy5crBwb9bdt2YygF0U5QapLOzc5zPY3K5XKlUGs/XQE9Pz3j+R4hsNtvW1lYsFsftNZBO\np7u7u4eGhsbt3+rb29szmczIyMgGXAPRiW25pOhRhoeHOzs7BwcHa3M4Dah8541CodCwFUYr\n/1NcCx9+hQB6eHi48n94bASmK8m4n66U/8ptulKDv7M07BnemOlKGwblagAAIABJREFUa8hm\ns+XpSr0LaSY1O121GSifz7e1RU9XG/qklecz+Xx+3L4QUqlUOp1u4cOvEEBXe8O488/48abT\nz7z1sg/tsfPW5S3ZrmlnXvHTc3ff7M7551XYsVTs/8THLm8/+IOXzz11NH1OkqRj0kFb5zI/\nvPvZ8sN834P/tWp4n0O2rNy0MbtX0y0AAAAAAGOl2gD6pucGdjrhXS/e/rbjdhxccUuFHfuf\nvf7X/fnX7d71wP1/8+DDf05SuY8eOe13182/9YElzzy2+Nq5n+3a6uDjtu1JkqRC02M3ffXL\nX/l25eestanCLgAAAAAAjLVqb8GxfXtm1dK/vHj78w+vzLRvXWHHVb97IkmSL3/6Ey/cOGG7\ns776hf12fsf5Hxi6+BsXzV0xmNppz5nnLzhlNA5fW9PTt3//luc2P/H4t1Z4ToWmCrsAAAAA\nADC2qg2gz9p38xO+etzPPvnwfi+4jUb/sttPvOGxyft8qcKOWx7wie8csJa2VObQ48849Pj1\naDrw8uuXzvrkBu9eaRcAAAAAAMZUtSuAj7jhS9unnpy5w17v++iCJEke/sa1580+Yddd3vBk\ncatLbzw6ssK/88ef/ufS6a+v2XAAAAAAAGywaldAd0554y9/9Z33v++Mqz83P0mSRWefcWcq\ns9tBR3/rssvfvFV3YIF/r3f7vc//p0p3/AAAAAAAoEFUG0AnSTJhl8O+dvth1yx//OFHlxUy\nndvustu2k9rjKntJ3dtJnwEAAAAAmkOlAPrmm2+u0Po/y5564K8/v+Utbxm7kgAAAAAAaAWV\nAui3vvWtVfZSKpXGohgAAAAAAFpHpQB60aJFoz8X88+ec+wJPx/Y+qTTT33dfjMmZQaXPnzv\nFRde+sx2Ry763ufCywQAAAAAoNlUCqBnzpw5+vMd75/x8/5d7vr9fftu+r/3fT70jW879bQT\nX7vV3kfOec9vrnl9bJkAAAAAADSbar+E8P99belO7140mj7/785d0y86+eWvvvKjyTUPBdQG\nAAAAEG7K4iWh/T+/126h/QM0snSVz/vdQCGde6knp5ORoT+MZUUAAAAAALSEagPoo6d0/e5f\nP/bE0MgLN44MPXnWNUu7Nj8moDAAAAAAAJpbtQH0nCveNfTnO/eccdjF//atn/3yN7958L6b\nr7/kjbvvcevzg+/84pmhJQIAAAAA0IyqvQf09odfefvF2aP/35UfOe7HoxszuSkfuPi2Lxy+\nfUxtAAAAAAA0sWoD6CRJDvrQF5adNPuH3/3x4keX5dMd2+y8+yFvfP32PevRAwAAAAAA48f6\nxcdtvf/w5nee8uagWgAAAAAAaCGVAui99947lW7/xQM/K/9c4Zm//OUvx7guAAAAAACaXKUA\nuqenJ5VuL/88adKkmtQDAAAAAECLqBRA/+QnPxn9+Y477ogvBgBIkiTpXbig+icXk2QoSVJJ\n0lv1Lqtmz92AqgAA2EhTFi8J7X/5jKmh/QNsgHS9CwAAAAAAoDWtO4Ae+tPvf/6zn/7qN48W\nX6p11R8fueDYN4x5WQAAAAAANLuKAXRx4HMnH9o7ZYdX7X/AXrvuPGXawT94cnVx+Jn5J/3z\ntB222WTihK727IStps/52o9qVS0AAAAAAE2j0j2g//uzh51xzZ1t3Tsd/qYDtugeuuub/3Hk\nvu+5aL8Hz/32E5u/fK+9XjktVSp1T5q802771axcAAAAAACaRaUA+oLP/Lyta9p/PfXgXpu0\nJ0mS//yv99xyr1O/nT/kwkU/nj2zVhUCAAAAANCUKt2C4/t/Gtz8Hy8qp89JkrT17nrRvlsk\nSfLF019di9IAAAAAAGhmlQLolYXihKkTX7hl0u4TkyTZuaPSumkAAAAAAEgq34IjSdYMqFPp\nVFwpAAAAAGykKYuXhPa/fMbU0P6BFlNpBTQAAAAAAGwwATQAAAAAACHWcQuO5+6/9txzfzT6\n8OmfPZskybnnnrvG0+bNmzfmlQEAAAAA0NTWEUAvv//q+fevuXH+/PlrbBFAAwAAAACwhkoB\n9KJFi2pVBgAAAAAAraZSAD1z5sya1QEAAAAAQIvxJYQAAAAAAIQQQAMAAAAAEEIADQAAAABA\nCAE0AAAAAAAhBNAAAAAAAISoFEC/bs8Z7/3JM+Wfp0+fvuDJVTUpCQAAAACAVpCt0Lbsd79d\nesFVd899Q1s6eeSRRx76+X33PdP7ks/cd999Y8oDAAAAAKBZVQqgvzjrgNddOO/AH8wrP/zm\nkYd+cy3PLJVKY10YAAAAAADNrVIAfdCnb3/sqLseeOyPI6XSMccc8/rPX3vSFl01qwwAAAAA\ngKZWKYBOkmSHV75mh1cmSZLcdNNNbzj66Hds2V2LogAAAAAAaH7rCKBH3XjjjaF1AAAAAADQ\nYqoNoMv6n37wppt//OvHlvWPZLfacbfXv/XIV2zXE1QZAAAAAABNbT0C6G/OPebYT/z7UPFv\n3zc458PvP2rO9TcseHtAYQAAAAAANLd0lc97/MZjjzzvhs1nnnTDj+97+tkVzy9f9vPbb3rv\na7f49/OOfM9/PBFZIQAAAAAATanaFdCf+fB3erY54ZFbr+pKp8pbXnnQ218x87Diy7b899M/\nmxxxaViFAAAAAAA0pWpXQH9jef/LT/3QaPpclkp3fWjW1IHlXw8oDAAAAACA5lZtAN2TTg/+\nz+CLtw/+z2Aq43sIAQAAAABYU7UB9Id3mfi7f/3A/c8PvXDj8MpfzLr6txN3/lBAYQAAAAAA\nNLdq7wF94k0L5u12+qv/Yc+TZp346j127kgGHv3ve6677Nrf9ucuufHE0BIBAAAAAGhG1QbQ\nk6Z+4Nc/zr77A2ddccGZV/x146ZTX/OFL/zb+6dNCioOAAAAAIDmVW0AnSTJtgeduug3p/zh\nkQcefnTZUNK+9Y677jN9u2pv4QEAAAAAwDizHgF0kiRJktp22iu3nRZSCgAAAAAArcQKZgAA\nAAAAQgigAQAAAAAIIYAGAAAAACBElQF0cWhoKF+KLQUAAAAAgFZSVQBdGlk1qavz0H9/NLoa\nAAAAAABaRraaJ6UyE8+Yvum/Xvvz5B07RRcEAI2sd+GC0P5XzZ4b2j8AAADUUrX3gD7nJ9/b\n46nTT7vk5hVDI6EFAQAAAADQGqpaAZ0kyZuPnlPcYvsvfvhtX/xIxxZbTelo+7vk+vHHHw+o\nDQAAAACAJlZtAN3R0ZEkW7/pTVuHVgMAAAAAQMuoNoC+5ZZbQusAAAAAAKDFVHsPaAAAAAAA\nWC/VroAuW3LbDV//4b1PPvun13z6imPa7rlv2R4zZ2weVBkAAAAAAE2t+gC6dPmJB5x23T3l\nB13nXPKm1ZcctPd3X3PypbdeeVo2FVQeAAAAxJqyeElo/yv2mB7aPwA0smpvwfHo9Uecdt09\nB5928a+WPl3esskuF15w6v53XjXr8CseCSsPAAAAAIBmVW0Aff4ZP950+pm3XvahPXbeurwl\n2zXtzCt+eu7um905/7yw8gAAAAAAaFbVBtA3PTew0wnvevH2tx234+CKW8a0JAAAAAAAWkG1\nAfT27ZlVS//y4u3PP7wy0771mJYEAAAAAEArqDaAPmvfzX/31eN+9tzgCzf2L7v9xBsem7z3\nxwIKAwAAAACguVUbQB9xw5e2Tz05c4e93vfRBUmSPPyNa8+bfcKuu7zhyeJWl954dGSFAAAA\nAAA0pWoD6M4pb/zlr77z9n9MX/25+UmSLDr7jHmf/Wrvfkd965cPvX2r7sACAQAAAABoTtnq\nnzphl8O+dvth1yx//OFHlxUyndvustu2k9rjKgMAAAAAoKmtRwCdFAe+95VLvn7LbY88/sdC\ntvtlU/d809Ennnz4vqmw4gAAAAAAaF7V3oJjZPgPJ+33D2866czrb77z6T8P559/6gdf/9Kp\nb9lv+pvnrBophZYIAAAAAEAzqnYF9J2nv/7LP3/2tR+89Lrz3/ey3rYkSQp9T1455/hZn7/g\nkPlvu++8V0YWCQDr1rtwQWj/q2bPDe0fAIAXm7J4SWj/y2dMDe0fgGpXQM/5xmObTD37js/P\nKqfPSZJku7c/7eI75k7f9KEvnBVWHgAAAAAAzaraAPrX/fkd3vX2F29/+/E7Dq+6b0xLAgAA\nAACgFVQbQL9ls87n7vv9i7c/de9z7RMOHNOSAAAAAABoBdUG0Odf9d5lPzz2U9/9zQs3/vb7\nC4/57pN7fDD2npsAAAAAADSjSl9CePrpp7/w4Wu3TX/8n3e9cp8D/3H6LhNSq5Y+8sBd9z+W\nyW1x+Cb3JMk+wXUCAAAAANBkKgXQV1xxxZrPzmb/8NC9f3jo3tGHSXHFvDM+ctYHZ0UVCAAA\nAABAc6oUQOfz+ZrVAQAAAABAi6n2HtAAAAAAALBeKq2AXsPAM4/89IFfr+h7iWXR73jHO8au\nJAAAAAAAWkG1AfQT35z9ind+7k/54ku2CqABAAAAAFhDtQH06e/7wl8y28277JMH7bp9NhVa\nEgBA4+pduCC0/1Wz54b2DwAAUEvVBtC3/3loz3Nvnn/qnqHVAAAAAADQMqr9EsJXT8h1bN4R\nWgoAAAAAAK2k2gD6ogWH3D/7pPufHQitBgAAAACAllHtLTh2m/XtUy6bsv/2Ox982Gu3m9y1\nRutVV1011oUBAAAAANDcqg2g7z7zwMuWPJ8kz9/2/f948ZcQCqABAAAAAFhDtbfg+MBl9/ds\nd+S9T6zIDw68WGiJAAAAAAA0o6pWQJeKfYv7Cwde+cn9XrZpdEEAAAAAALSGqlZAp1LZl7Vn\nnn9weXQ1AAAAAAC0jOpuwZFq/+6l73nk82+6+JbFpeCCAAAAAABoDdV+CeH7v7J0m+yqjxy+\n+5mTtpjS07ZG61NPPTXWhQEAAAAA0NyqDaAnT548+Q1v3iu0FgAAAAAAWki1AfS3vvWt0DoA\nAAAAAGgx1QbQK1eurNA6ceLEsSgGAAAAAIDWUW0APWnSpAqtpZLvJgTgpfUuXBDaf9/H5of2\nDwAAAGywagPo+fPn/93jUmHZY7/+9g03/ym1zfwvXjDmZQEAAAAA0OyqDaDnzZv34o0XL7zv\n4JfPvPjzD8w58dgxrQoAAAAAgKaX3pidO7fY96oFez33q4vuXDk0VgUBAAAAANAaNiqATpKk\na9uuVCoztattTKoBAAAAAKBlbFQAXcwvv+icB9t69t6ybWODbAAAAAAAWky194Def//9X7St\n+MzSh36/YvCVZ182tjUBAAAAANACqg2gX0p6u91f99aD333hnH3HrBwAAAAAAFpFtQH0vffe\nG1oHAAAAAAAtxr2bAQAAAAAIUWkF9JIlS6rsZerUqWNRDAAAAAAAraNSAD1t2rQqeymVSmNR\nDAAAAAAAraNSAD1//vwKrcX8in+76IrH+/PpTM8YFwUAAAAAQPOrFEDPmzdvbU2//dGX3nvy\nZx7vz29/wLuvvuaygMIAAAAAAGhu6/0lhMN/fvjsY/9p6hved9+ftphz1a2P/+TfDn35xIjK\nAAAAAABoapVWQL9I8barzzn1QwsfHyj807FnX335OdMn5KLqAgAAAACgyVUbQK9c8qNZJ5/8\n1buf6v2H11x51TWnHLJzaFkAAAAAADS7dd+Co1R4/tpz3r3tbod97d7n3zXn6ieWLpI+AwAA\nAACwTutYAf3obVe/9+T/e+cTq7Z79bu/ec2lr586qTZlAQAAAADQ7CoF0HPfc+D51/80nd3s\n1E9edd4ph2SSkRUrVrzkMzfbbLOY8gAAAAAAaFaVAujzvnp3kiQj+ee+9PFjvvTxSr2USqWx\nLQsAAAAAgGZXKYCeNWtWzeoAAAAAAKDFVAqgL7300prVAQAAAABAi0nXuwAAAAAAAFpTpRXQ\n41xXV1c63egBfSqVKv+wySab1LeSOspkMt3d3V1dXfUupD7KV2kmkxnP10CSJBMmTBi3N6Mv\nXwPZbLZhr4FCcP8TJ04s/xk9UPkMt9IoNRsoepQJEyakUqlNNtmkNQ5nA17LmUwmSZLOzs72\n9vaAippAKpVKp9MN+zYYqre3d3RC2LBMV8pMVxp5uhJtdLoSPVDDnuHyNdDe3t7W1lbvWtZU\nm5M2Ol2JHqg2h9NKo9RsoO7u7hqkTI1/0rq6ujo7O8e2mGaRSqVq8z5QF8VisUKrAHqthoaG\nRkZG6l3FOuRyufLrdvXq1fWupW56e3sHBwfz+Xy9C6mPjo6O9vb2YrE4nq+BiRMn9vf3N/4L\nNkhnZ2culxsZGenr66t3LS+tI7j/vr6+CRMm9PX1RQdv5VdZ9OHUcpSaDRQ9Sn9/f09Pz+rV\nq1vjcDbg/by3tzedTg8PDw8ODkaU1Pja2to6Ojpa+KOwQmg1MDBQebrfCExXEtOVhp+uROvv\n7+/t7a3B4Tfsq6y7uzubzebz+YGBgXrXsqbanLT+/v7u7u4ajFWbw2mlUWo20ODgYEdH9ESy\noU9aeT4zNDQ0PDwcUFETaG9vz2azLfxRWGHKKoBeq5GRkcbPNMsrnpIkafxS45RKpab4ZQUp\nryAolUrj9gyUFQqFQiF6VWKDKi94bORrIHqSVf7VFwqF6AC6fIajD6eWo9RsoBpcA+WXQGsc\nzga8lstrKsfzp2E6nW7kt8FQhUKh8TNN05Wy8TxdKWcu4/kaKB94DS6Ahj3D5Y+qYrHYgBXW\npqTyb78GY9XmcFpplJoNNDIyUoP/B9P4J208T1mz2Wwmkxmfh9/ot5gAAAAAAKBJCaABAAAA\nAAghgAYAAAAAIIQAGgAAAACAEAJoAAAAAABCZOtdAAAAADBmpixeEtr/8hlTQ/sHoMVYAQ0A\nAAAAQAgBNAAAAAAAIQTQAAAAAACEEEADAAAAABDClxACAAAAAOtnPb/ydL2/H9VXnrYMK6AB\nAAAAAAghgAYAAAAAIIQAGgAAAACAEAJoAAAAAABCCKABAAAAAAghgAYAAAAAIIQAGgAAAACA\nEAJoAAAAAABCCKABAAAAAAghgAYAAAAAIIQAGgAAAACAENl6FwAAAAA0mSmLl4T2v3zG1ND+\nAagZK6ABAAAAAAghgAYAAAAAIIQAGgAAAACAEAJoAAAAAABCCKABAAAAAAghgAYAAAAAIIQA\nGgAAAACAEAJoAAAAAABCCKABAAAAAAghgAYAAAAAIIQAGgAAAACAEAJoAAAAAABCZOtdAAB1\n07twQWj/q2bPDe0fAAAAaHBWQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMA\nAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAh\nBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAA\nAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQ\nQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAA\nAAAhBNAAAAAAAIQQQAMAAAAAEEIADQAAAABACAE0AAAAAAAhBNAAAAAAAIQQQAMAAAAAEEIA\nDQAAAABACAE0AAAAAAAhsvUuAACANfUuXFD9kwtJUkiSTJL0Vr3LqtlzN6AqAACA9WUFNAAA\nAAAAIQTQAAAAAACEEEADAAAAABBCAA0AAAAAQAgBNAAAAAAAIQTQAAAAAACEEEADAAAAABBC\nAA0AAAAAQAgBNAAAAAAAIQTQAAAAAACEEEADAAAAABBCAA0AAAAAQAgBNAAAAAAAIQTQAAAA\nAACEEEADAAAAABBCAA0AAAAAQAgBNAAAAAAAIQTQAAAAAACEEEADAAAAABBCAA0AAAAAQAgB\nNAAAAAAAIQTQAAAAAACEyNa7AAAAAACAlzZl8ZLQ/pfPmBraP1ZAAwAAAAAQQgANAAAAAEAI\nATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAA\nAAAQQgANAAAAAEAIATQAAAAAACEE0AAAAAAAhBBAAwAAAAAQQgANAAAAAEAIATQAAAAAACEE\n0AAAAAAAhBBAAwAAAAAQQgANAAAAAECIbL0LAOAl9C5cUP2Th8q7rE//q2bPXa96AAAAADaA\nFdAAAAAAAIQQQAMAAAAAEEIADQAAAABACPeABgAYv9brjvMbwB3nAQBgnLMCGgAAAACAEAJo\nAAAAAABCCKABAAAAAAhR03tAX/cvx3csuOKYKZ1/3VBc9I3Lb7nrF0+tykyb8aoTTj9xx65s\nFU3JRuxeTbcAAAAAAIyBmq2ALi39ydXfWvbnQqk0uumxb5590Q337nfEKfM+fFzPo7fN+ciV\nxSqaNmb3aroFAAAAAGBM1GL977P3XvyxS+9esXr477aWhj93w292eudnjjpkpyRJdr4wddRx\nF17/9Anv2aa7UtPG7L5127q7BQAAAABgjNRiBfSk3Y6as+BTn/n0x164cWjlXU8Ojhx66Dbl\nh+2TDti7J/fAoj9WbtqY3avpFgAAAACAsVKLFdC5CdvsPCEZGe544cbhvoeSJNm1q210y/Su\n7A8eWpkcW6lpY3Yffu06ur3jjjtmz5492nr55Ze/6lWv2pgDr6XJkyfXu4R66u3t7e3trXcV\n9ZTJZMb5NTBp0qR6lzDGhoL7L18wrTHKpptuWv6zNQ6nlqPUbKDoUcrvAJMnT26Nw2nJa6A2\nxudH4cSJE9Pp5vhecdOV1puurK+2trYGvgaWhPY+Ol0JHSX52zth7OHUdpSaDRQ7yuh0pTUO\nxzWwAWqTWrTYSav54dRCA38UbpSRkZEKrXWbrRaH+pIk2Sz7twImt2UKqwcrN23M7tV0CwAA\nAADAWKnFCuiXlM51JknyfKHYk8mUt6zIj2Qm5So3bczu6+x2t912+9SnPjX6cJtttlm1atUY\nH/ZYa2tr6+joSJKk8UuN093dPTQ0VCgU6l1IfbS3t+dyuWKx2NfXV+9a6qa3t7evr69YbKlv\nFc2t+ykbpfym0RqjrF69uqenZ/Xq1W3rfu5GaaWTNvqp0RqH09fX19XVtXr16tY4nJa8BqJl\ns9n29vYW/iissGaqv7+/9IJv+W5MpitJi05XqtfR0dHW1jYyMtLf31/vWupjdLoSPVBt3nVb\naZSaDTQ6XYkeqJV+Oy12DQwMDLS3t0eP0mInrcUOJ5fLZbPZVv0oLJVKEyZMWFtr3QLotu7d\nk+SuJQOF7dr/Nw5eOlCYeMCkyk0bs/s6u918880POeSQ0YcrV64cGor+b6kbK5VKlX9o/FLj\ndHV1FQqFcXsGMplMLpcrlUrj9gwkSdLb25vP51vsHyGiI6HyBdMaowwPD5f/jA6gW+mkjb5j\ntMbh5PP58litcTgteQ3UQC6Xa+GPwgoBdD6fr/wfHhuB6UrSotOV6uVyuSRJisXiuL0GRqcr\n0QPV5gy30ig1G2h0uhI9UCv9dlrsGigUCuU3w1AtdtJa7HDS6XQ6nR6fH4V1uwVHx6SDts5l\nfnj3s+WH+b4H/2vV8D6HbFm5aWN2r6ZbAAAAAADGSv2+sSSV++iR03533fxbH1jyzGOLr537\n2a6tDj5u257KTY/d9NUvf+XbG7h7hV0AAAAAABhrdbsFR5IkO7/j/A8MXfyNi+auGEzttOfM\n8xeckl5X09O3f/+W5zY/8fi3btjuFXYBAAAAAGBs1S6AzuS2/c53vvN3m1KZQ48/49DjX+rZ\na2k68PLrl8765AbvXmkXAAAAAADGVJOtAP7jT/9z6fTX17sKAAAAAADWrZ634NgAvdvvff4/\nbV3vKgAAAAAAWLcmC6C7t5M+AwAAAAA0hya7BQcAAAAAAM1CAA0AAAAAQAgBNAAAAAAAIQTQ\n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\nrkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 600,
       "width": 960
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(cleaned_data, aes(x=start_hour, fill= member_casual))+\n",
    "geom_bar(show.legend=F)+\n",
    "facet_wrap(~member_casual)+\n",
    "labs(title=\"Number of Ride by Hour\", subtitle=\"Casual vs Member\", caption=\"Data from: August 2021-July 2022\", x=\"Start Hour\", y=\"Number of Ride\")+\n",
    "scale_y_continuous(labels=scales::comma)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3cd49317",
   "metadata": {
    "papermill": {
     "duration": 0.017482,
     "end_time": "2022-11-06T09:22:34.996193",
     "exception": false,
     "start_time": "2022-11-06T09:22:34.978711",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "we can see that\n",
    "* Both casual and member riders are more like to ride between 4pm to 6 pm.\n",
    "* we have more member during morning,between 7am to 8am.\n",
    "* Now we know that the riding rush hour time of both member is 4pm to 6pm.  "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "6a979773",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:35.035110Z",
     "iopub.status.busy": "2022-11-06T09:22:35.033123Z",
     "iopub.status.idle": "2022-11-06T09:22:35.421231Z",
     "shell.execute_reply": "2022-11-06T09:22:35.419275Z"
    },
    "papermill": {
     "duration": 0.410386,
     "end_time": "2022-11-06T09:22:35.423651",
     "exception": false,
     "start_time": "2022-11-06T09:22:35.013265",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'Weekdays'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Weekdays</th><th scope=col>member_casual</th><th scope=col>num_of_ride</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Monday   </td><td>casual</td><td>299626</td><td>29.72422</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>casual</td><td>273782</td><td>25.45607</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>casual</td><td>281757</td><td>25.00378</td></tr>\n",
       "\t<tr><td>Thursday </td><td>casual</td><td>316087</td><td>26.19856</td></tr>\n",
       "\t<tr><td>Friday   </td><td>casual</td><td>347599</td><td>27.40979</td></tr>\n",
       "\t<tr><td>Saturday </td><td>casual</td><td>527499</td><td>31.83880</td></tr>\n",
       "\t<tr><td>Sunday   </td><td>casual</td><td>475539</td><td>33.97274</td></tr>\n",
       "\t<tr><td>Monday   </td><td>member</td><td>472359</td><td>12.56823</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>member</td><td>523347</td><td>12.14701</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>member</td><td>522582</td><td>12.17384</td></tr>\n",
       "\t<tr><td>Thursday </td><td>member</td><td>522627</td><td>12.40715</td></tr>\n",
       "\t<tr><td>Friday   </td><td>member</td><td>466647</td><td>12.60663</td></tr>\n",
       "\t<tr><td>Saturday </td><td>member</td><td>453458</td><td>14.47505</td></tr>\n",
       "\t<tr><td>Sunday   </td><td>member</td><td>417918</td><td>14.63208</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Weekdays & member\\_casual & num\\_of\\_ride & average\\_duration\\\\\n",
       " <ord> & <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Monday    & casual & 299626 & 29.72422\\\\\n",
       "\t Tuesday   & casual & 273782 & 25.45607\\\\\n",
       "\t Wednesday & casual & 281757 & 25.00378\\\\\n",
       "\t Thursday  & casual & 316087 & 26.19856\\\\\n",
       "\t Friday    & casual & 347599 & 27.40979\\\\\n",
       "\t Saturday  & casual & 527499 & 31.83880\\\\\n",
       "\t Sunday    & casual & 475539 & 33.97274\\\\\n",
       "\t Monday    & member & 472359 & 12.56823\\\\\n",
       "\t Tuesday   & member & 523347 & 12.14701\\\\\n",
       "\t Wednesday & member & 522582 & 12.17384\\\\\n",
       "\t Thursday  & member & 522627 & 12.40715\\\\\n",
       "\t Friday    & member & 466647 & 12.60663\\\\\n",
       "\t Saturday  & member & 453458 & 14.47505\\\\\n",
       "\t Sunday    & member & 417918 & 14.63208\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 14 × 4\n",
       "\n",
       "| Weekdays &lt;ord&gt; | member_casual &lt;chr&gt; | num_of_ride &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| Monday    | casual | 299626 | 29.72422 |\n",
       "| Tuesday   | casual | 273782 | 25.45607 |\n",
       "| Wednesday | casual | 281757 | 25.00378 |\n",
       "| Thursday  | casual | 316087 | 26.19856 |\n",
       "| Friday    | casual | 347599 | 27.40979 |\n",
       "| Saturday  | casual | 527499 | 31.83880 |\n",
       "| Sunday    | casual | 475539 | 33.97274 |\n",
       "| Monday    | member | 472359 | 12.56823 |\n",
       "| Tuesday   | member | 523347 | 12.14701 |\n",
       "| Wednesday | member | 522582 | 12.17384 |\n",
       "| Thursday  | member | 522627 | 12.40715 |\n",
       "| Friday    | member | 466647 | 12.60663 |\n",
       "| Saturday  | member | 453458 | 14.47505 |\n",
       "| Sunday    | member | 417918 | 14.63208 |\n",
       "\n"
      ],
      "text/plain": [
       "   Weekdays  member_casual num_of_ride average_duration\n",
       "1  Monday    casual        299626      29.72422        \n",
       "2  Tuesday   casual        273782      25.45607        \n",
       "3  Wednesday casual        281757      25.00378        \n",
       "4  Thursday  casual        316087      26.19856        \n",
       "5  Friday    casual        347599      27.40979        \n",
       "6  Saturday  casual        527499      31.83880        \n",
       "7  Sunday    casual        475539      33.97274        \n",
       "8  Monday    member        472359      12.56823        \n",
       "9  Tuesday   member        523347      12.14701        \n",
       "10 Wednesday member        522582      12.17384        \n",
       "11 Thursday  member        522627      12.40715        \n",
       "12 Friday    member        466647      12.60663        \n",
       "13 Saturday  member        453458      14.47505        \n",
       "14 Sunday    member        417918      14.63208        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#average duration \n",
    "viz <- cleaned_data%>%\n",
    "    mutate(\"Weekdays\"= cleaned_data$day_of_week)%>%\n",
    "    group_by(Weekdays, member_casual)%>%\n",
    "    summarise(num_of_ride = n(), average_duration = mean(ride_duration_min))%>%\n",
    "    arrange(member_casual, Weekdays)\n",
    "\n",
    "tibble(viz)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "7113d2c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:35.462563Z",
     "iopub.status.busy": "2022-11-06T09:22:35.460700Z",
     "iopub.status.idle": "2022-11-06T09:22:35.866849Z",
     "shell.execute_reply": "2022-11-06T09:22:35.865025Z"
    },
    "papermill": {
     "duration": 0.429157,
     "end_time": "2022-11-06T09:22:35.870031",
     "exception": false,
     "start_time": "2022-11-06T09:22:35.440874",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n4BtLs9c/uHbxc4NnLKjfZUQcBgMAAACAqijWYNd3xi3bJCzq2aLzycPHhBA+mX772HMHtW+9\n36LCRpMfPDyeEwIAAABAFRJrsKvW4IB5Hzx66C6J/752dAjhhYvOGTXh3hrdD3t43oeHNqoe\nxwEBAAAAoCpJjvG8rIKimq173/9c79uWfPPJ14vzk6o1bb1D09ppcR0OAAAAAKqaWINdg/qt\nDh04aPDgwft2brFzgxZxnQkAAAAAqqxY/yS2Z6swbfKoXl2aNe287yXX3ff1ity4jgUAAAAA\nVVOswe6Zt79e9uWbN447p1Xh52OHHb19g3o9Dz35zsffWFcY1/EAAAAAoGqJNdiFEOq03OXU\nkde88OH3P37yyoQLB+V+/PDgf+5Wr1G74869Mn7zAQAAAECVEutn2K2vYfsew8b0GHLW2VMu\nHnLujc/ccc35t189otwnKy0tLa1atWrxWLkgHotu5jIzM4uKiip7is2erVVatWrV0tJ8X81f\nZWuVlpqaWrt27cqeYktgd/1BYmKirVUubK3SatWqVdkjbAlsrdL8Jl8ubK3S/CZfMVauXFnZ\nIxAJGx3s1v08/9GHZs2aNeux5+dlFxbVat6lf/8B8ZistPz8/MLCuPwJbko8Ft3M5ebmFhT4\nj9RfZWuVlpeXl5eXV9lTbPZsrdIKCgqys7Mre4otgd31B0VFRbZWubC1SsvJyVFV/jpbqzS/\nyZcLW6u0/Pz83FwfZw8VJNZgl/X9Rw/PmjVr1qynXvkkr6io2tbt+p026ogjjujdffuEuA64\nnoKCgpycnHis7N/FpeXm5qoqf52tVVp+fr7/6fvX2VqlCXblxe76A8GuvNhapWVnZwt2f52t\nVZrf5MuFrVVaXl6e/yZChYk12NXeZsfCoqLUWs37nHDeEQMG9Nmrc0qFhToAAAAAqDJiDXb7\nH3X6gAED+vbuXj3xj6FuzQ8fVW/SsbwHAwAAAICqKNZg98Q91/3hSPbSL2c/MGP69OmPv/Jp\nfnw+Wg4AAAAAqpqN/tKJvF8XPTHzgenTp8+e+15OYVEIoUGb3eIwGAAAAABURbEGu4Lsn+c8\n9OD06dMfevL1rILCEEL1xjscMeDII488slfX5nEcEAAAAACqkg0Eu8L8lS89OnP69OkzZ7+w\nLK8ghJCxdZt9my9/9s0lK7//ONn3TgAAAABAuSor2J15zEEPPvTMj2vzQwi1m3cefEjfvoce\n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\nsAMAAAAAAAA0hMAOAAAAAAAA0BACOwAAAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAAADSEwA4A\nAAAAAADQEAI7AAAAAAAAQEMI7AAAAAAAAAANIbADAAAAAAAANITADgAAAAAAANAQAjsAAAAA\nAABAQwjsAAAAAAAAAA0hsAMAAAAAAAA0hMAOAAAAAAAA0BACOwAAAAAAAEBDCOwAAAAAAAAA\nDSGwAwAAAAAAADSEwA4AAAAAAADQEAI7AAAAAAAAQEMI7AAAAAAAAAANIbADAAAAAAAANITA\nDgAAAAAAANAQAjsAAAAAAABAQwjsAAAAAAAAAA0hsAMAAAAAAAA0hMAOAAAAAAAA0BACOwAA\nAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAAADSEwA4AAAAAAADQEAI7AAAAAAAAQEMI7AAAAAAA\nAAANIbADAAAAAAAANITADgAAAAAAANAQAjsAAAAAAABAQwjsAAAAAAAAAA0hsAMAAAAAAAA0\nhMAOAAAAAAAA0BACOwAAAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAAADSEwA4AAAAAAADQEAI7\nAAAAAAAAQEMI7AAAAAAAAAANIbADAAAAAAAANITADgAAAAAAANAQAjsAAAAAAABAQwjsAAAA\nAAAAAA0hsAMAAAAAAAA0hMAOAAAAAAAA0BACOwAAAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAA\nADSEwA4AAAAAAADQEAI7AAAAAAAAQEMI7AAAAAAAAAANIbADAAAAAAAANITADgAAAAAAANAQ\nAjsAAAAAAABAQwjsAAAAAAAAAA0hsAMAAAAAAAA0hMAOAAAAAAAA0BACOwAAAAAAAEBDCOwA\nAAAAAAAADSGwAwAAAAAAADSEwA4AAAAAAADQEAI7AAAAAAAAQEMI7AAAAAAAAAANIbADAAAA\nAAAANITADgAAAAAAANAQAjsAAAAAAABAQwjsAAAAAAAAAA0hsAMAAAAAAAA0hMAOAAAAAAAA\n0BACOwAAAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAAADSEwA4AAAAAAADQEAI7AAAAAAAAQEMI\n7AAAAAAAAAANIbADAAAAAAAANITADgAAAAAAANAQAjsAAAAAAABAQwjsAAAAAAAAAA0hsAMA\nAAAAAAA0hMAOAAAAAAAA0BACOwAAAAAAAEBDCOwAAAAAAAAADSGwAwAAAAAAADSEwA4AAAAA\n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\nK3tXnukyttK/TWrqF3+E6ZXMfSAG7ldu2LvTklJFRE2LGffu9BL9x3bN5yoiisKVubAm7+vl\n1G3fbw5L6JLHSURUNXHNtVhVNa09FTG+ore5z46z0c55e2cyrQOsY7KCbTm415swqkH6Fr1d\n7oe7NWnSpKQjb7xxn0vfTRm/9Ej9N3u06VnMaIo9f/TAqgVjTsfOmdDCWvCxd9KorRUmLOxf\nMsvGiRfd01UaAJvjfUP2kaduudt7P09WF9rfS+jirq+5bPJ+1S3yXKZ3kmZS9To+Q0NExK1Y\nSTcREVHTIkTEtUipssXdbTskvBBc/N406rYd2RvapU1BEUkI3RiRauhSxHHLulNSsZaIpCVf\nOxidXLJrmf9yFCYrWDy/ySotKU5vdH4mu0I2prPLXbZsWSsdzIXUv3//LBsSXhRfrPs7b70J\ngzuVNy+WfKlSKacLw1d9IC2WPMOjMJXhP1Yab7oAWyGwyz5yFeii3ztq1eXYngXu3vhz5su9\nni/1crwwy9InLenalwuX/PLnqagUXf5iFdv0DqpVyFVEurZu+cbHU09Nn/HXtWgXjzzVm3Qf\n1K6GeZPEsL+XLFp7JOSfBEPuV5p3tXwGSo4KWbpwxcGj56KTTd55izbqMLBtzYAznw0av6/0\n+hV335JGnfuky4jdi9Z/5W+vz6qnAc+fmtK8xf86L1v3prejuaFr65aBC74cnNdFTQ3f+PmS\nPYdPX4tIzlukXMuufeqX9DD3CQ3+YfGXW0Ou3FCcvUpVbTS83/+cdEpG1SUU2ItMMXg083T8\ncedxaVNQRK5t+80xd8s6b51fPf2rNLWWXpH4W5tNqlq/sreIZFQzGdWGlckqo109svasHILa\ny35MqRErpk/5IfgfnZN39cY9BneoIWJtKuvYqkXHJUtDl8355bjjqlXjKSE8nQcKqU2LFk2X\nrOmRx4nXPljEp6lJEbfSt+RvMmBcvnBVRMmgHj7t9ub34YlyY1Tb/TU3rBqe0TwmD1UgU1ZO\nZq3SMn415BMiYHPcLZKN6Iy9KnkfWH7y7qKasuyv29W7pf9uAnXxsLe3nTR1HTJuxsSRlZwv\nfjRyyIn4VPO6re/MKNBy0IJPFw1sVWrH6ulrQ+NFRE29M3HQlN/D3LsPm/jOwPYRO+Z+dyfB\n3H/FqPcOhOcb/O7Uj2ZMaVHB9OWHI24lm/K3aZoUuf1wbIq5z+HPf3cv2pO5OOdYNXboN8eV\n1r2Hz5w6tnFJmTem70/X40UkNf7EoMmLJbD5xOmzRvdtdW7nl+9tvWKluoQCe8G9XCdP/O1v\n01QRkV2/3srbqKZHqfam5OtbwhNF5ObPp/RG//ruRsmgZqzXxiMnq4x29cjaEya3HOavKe9K\n5Taz5i8Y1Lr0z2umbwhLeOwm++e/5xTYavqHAyghPJYp5fap+5lnP0lXSJbOvPYhvZ4tXgoL\nXtBjxKSVX3//95kryaroHQpXrlzZfC3TI+uh55JVPX2d/RtO/XLp8Mfu31KBTFk5nPVKs4JP\niIBtcYVdtlKiS63wIZ8nmKo66pTY619dNfnOyu+y/N7a+FtrfrwaO/SLcXW9HESkWOkyJzp2\n/uybS3M7FxER5+oju75WXkTytRhWaPXekNuJ4uN0O3jh6USHWTNHmr8qvkQpx3ad3zfvzadR\n20H136jsZi8iAb5vfvbd5PNJqTU8mgS6LF3z682Kr+czpd75PCSyxoxqWf88wCYS72zeeCbq\n/a+Gl3W2E5Eixcum/d5p7ScnXptSJTk2OMGkNm5ap4SHUYoWnjLW47rR9Xbw/IyqSyiwF1ze\n1wLTvv76l6ikuo6h2yOSutbz0zs61Hc37v7pessOhQ8fuO2Sr48u45qp0OwHK7XxyMkqo129\nMijk4doTESa3HMWj/PCuDcuLSECLYf5f7jkVniT3riPISFSe3u0blBOR+NCtlBCsS4zcNXr0\nrvQtKzZt9tArkq6QLKxUjlA8OU+JDpPml967a9/vh39e//XKT/UObmWrvNKma9fyPg6SQT3k\ncTXaK4rOYG802omaYn3/lgoMPTSZKSsns15pVvAJEbAtArtsxSVvxwK6b5dfjO5f2O3Myn1e\nFfoa0/3iRNSpY3pjQD2vu/OyonNs6ee08MBl6VxERHwbFrD0zKXXiSoicnvPNQeP1yw/7Gjv\nWjXQxe6OiIg0b9nk2O8Hvrl87datmxdO/WHZtkMDv/Ebf5TXe4UfXRJnyNuzaK7nfNLQitir\nwaqqvtPhf+kbnVOviVRx9GpRp9jP03r2KhtYsXSpUhUCq1ct4HFiVobVJRTYC84xd2sX/cZf\njkcEeq0RO79mng4i0vgVn3d37Jb2AVvuJObrXEoyrhkrM49kMFlltKtH1p4wueUw/o3vr5lM\n8Kufz/yAEsJjOeVut3Zpp0eushSShfX5jeLJgQqUr9W9fC0RSQi/duTP37duWDcp6Mjc1QsK\nGPUZ1UPmWSqQKQsZVprVXxvmEyJgW9wSm70ohu7Vcv+x7JioyUuDw2p2LZF+paqKyH0XPut0\niqgm82M7x0ddlvzQ14u6GXQiYkoJm9K3+8x1e+J0rmWq1OkzeqSlQ76WzRPvbDken7Jn6fE8\nNfo68AWlOUCKqoqIwdle0Tuvv9/yBc1ERNHnGj57+fz3h1Qr5n3l6C8ThnSftOJIRtUlFNiL\nT9G7tM7tdG3rhXPrTucq1EGviIgENKueeGfr2Vs/RKWaGlXwEis1k3FtSAaTVUa7enTtCZNb\nzuLolKn7bsxTmZmT692/aFJC+C8shfQvXvtwT3L0/mnTpl1NTjMvOnr613it9aSPJ6QlX1t9\nKcZKPViRfh6T9BXIlJWDWa+0h/unryI+IQK2xRV22U2xTvXCByy9cfnMdcnbKcA1/Sr30mXS\nktbvjkis4+EgIqopcfO1OK901x08zKe2f+K+HRcSOxVy0ItIWuK5A9FJviKxV5f+FZq84pt3\n3fWKiCRF7bZs4uDRsKrLp8t3HLhwNbbbe8WfxzlCC2JT776WJ0Xtj01TRcQpTyMxHdoentYy\nr/mXyNRl746JfGXw8Eb+kae+3XAwtXePNvlKVW4mcuWHUUO+WD5g1KOrSyiwbKHya35rvv5u\nvUQWGlna3OKYp42n4euF3/xgcChY281eMq6ZtzKYeazIaFc98v/xcO1J17lMbjB7eCp7wCOn\nL0oITy2jyhGKJ+fR2/v98fvvxuA7I6r7WBrTEiNFxNfFLvbqpxnVwwMeO48Jb+lzNuuVZl7M\nTBVZUE5AluEKu+zGKU+bYnbRk2ftyF2pp73ywKqODf2dF4+esfevE+dD/v5yxoiQFLc+b1oL\n7LwrBBW3j3937JwDwSdDjhz8+J2Jrka9iNi5FlPV1E17joWG3QoJ3vXhuBUicvlGpPlqvXaN\n/P/5Yq7OtUazx31JEF5Iil0JJ7s9C9afvRZ6KeSveeMXKYoiIvaulXtV8Ppy9NTte/+6eP70\nt5+O2XLqTr2aPiJi55aw5duVc9btPH3+0pljv23Yds05oGZG1SUUWLaQp87LKfEnQuJT2pa+\n+0vBiuLQMb/rue3XXQu2NU9OGdWMldrISEa7emTtCZMbJMOp7AGUEJ4tXvtgoXcoPLZZiT0z\nhixYvflQ8NETJ47t/3nzlGFzXQs16eLnbKUedIok3LoeERGdyXlMmLJyNuuVlvkqsqCcgCzD\n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"
     },
     "metadata": {
      "image/png": {
       "height": 600,
       "width": 840
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "options(repr.plot.width=14, repr.plot.height=10)\n",
    "ggplot(viz, aes(x=Weekdays, y=average_duration, fill=member_casual))+\n",
    "geom_col(position=\"dodge\")+\n",
    "labs(title=\"Average Duration of Ride\", subtitle=\"Casual vs Member\", caption='Data from: August 2021-July 2022', y='Average Duration')\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0cc31090",
   "metadata": {
    "papermill": {
     "duration": 0.019754,
     "end_time": "2022-11-06T09:22:35.909067",
     "exception": false,
     "start_time": "2022-11-06T09:22:35.889313",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can see that\n",
    "* The average duration of casual riders ride is more than 20 minutes and annual member ride is less than 15 minutes.\n",
    "* Casual have more riding time than members\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "b4841f0b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-06T09:22:35.950243Z",
     "iopub.status.busy": "2022-11-06T09:22:35.948687Z",
     "iopub.status.idle": "2022-11-06T09:22:42.817207Z",
     "shell.execute_reply": "2022-11-06T09:22:42.815443Z"
    },
    "papermill": {
     "duration": 6.89317,
     "end_time": "2022-11-06T09:22:42.820832",
     "exception": false,
     "start_time": "2022-11-06T09:22:35.927662",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAABpAAAASwCAIAAABzcp6JAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2BV1eHA8XNf9mAGRAQUBQFBEQdurYp7gHuDWuvWahEQrSK4tW5xW/ese1sX\n7loH2qrgKiqKCgIyQoCs9/sjGgOEJOZnyFE+n7/y7jv33HPvDU377RtJOp0OAAAAAEAcUs29\nAAAAAADgZ4IdAAAAAEREsAMAAACAiAh2AAAAABARwQ4AAAAAIiLYAQAAAEBEBDsAAAAAiIhg\nBwAAAAAREeyaU7KEzJzCTqv23OOw4Y/9d8Zig985pV+SJDu+9M2vvozFZj6+U4skST6aX/6r\nH2jJY0Wi5Ltxhw5Yr11hdoc+pzb3WppBQ05/7lfnLPnrmsrIabtC1wF7HPnQu9NrDl7sLt/c\nsyhJkru+L2na0wAAAIDfC8Gu+XXp1r3aiq1zpn756UM3XTRonU4H/u2F/8+06cp5r7322r/f\n/urXWudvdA0Nccbme9zywvisnpvvsMXqtQ74rZxI49R7+tVSGQXda1ilU9G8GZNfeOj6vfp3\nHfPMlGWzWgAAAPjdy2zuBRAe+c+EdQqyqh/O+3bibZeNPuFv9901YkDeap/fuGfXqu1d9z7r\nll4zO/Vq08Bpy+d/stlmm7Vc+fTZX55Z98hfOnPDLbmGpjtW46VLL//f7Kz8Nf731nP5qaTW\nIQ2/mL89DTj9ajmttvz008drbimdNelvR+102r0fn7vnwGGz3y5IJSHOuwwAAAC/HYJddAo6\nrnH0Bfdu0LV8/WMevG3IzucMfL9DViqEULTurgev2yRHbLqZm/dYDZSunF+WTufn96k3V/0u\n/T9PP7v1aqfc8ep1D3f8qnj8Nd/MG9a5MER5lwEAAOA3xFtiI7Xe0f8Y3KGgrGTC0c983YSH\nSS+cVlbZhPM3icp5C5rk8/WaVGXpgop0cy+iaaQy2w1onRNCmFFe0dxrAQAAgN8DwS5aGSef\nsmYI4V9nv1n1+L0x6y32dQ0zP3jiz/vv0L1jUU5Wdquizpvvcug9//6u6ql71miXXbhuCGHO\n5LOSJCnqeXPV9o+u2zRJkuP+N6v4yyf327x3YXb+7dNKlpw5hJBOVz49duTmvbu2yM1us0Ln\nAXsd8fii34Pxr6N7J0my58RFNqYrZidJUtB+76WtobZjVb50x3kDt+jbvnVhdkGrVdfc5Jgz\n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\nPv9ptronv2S11nltd651VZUVxT3zs1p1/Wv1lv9e2D+EcN03xXUvaTEv7LZq1XreOGHNjOwO\n00orqrbP/uK8EMKwiTOnT9gjhLDHhOlV20f3KcrKX+P16fOrZ3hoaL8Qwtn/m1X18O5eRSGE\nYc9PqXo4f8bjIYSMnJVe/WFB1ZbP7to6hLDPh9PT6XRVYjvpwY9/Oquym45aM4SwxyNfNORw\nN/VomyTJ9le+U+slAgAAAGgcb4ltHul0WQghJPVf/71e/XjqNxNWzvnxhXjpynkL0+l0RUnV\nwySVl52EWRMffPuruVVbNr7wte+//37f9nkNWUbdk9chSRVcun3nOV9e+E5xWdWWiy6eULDi\nIUd0LGjckvqMOLqidOqwt358V+x/z741K7/XmT0W+caJ8pIPz5ows9fRt25clFu9cadRl4cQ\n7r3mk+otWfm9/rb1SlU/57bduUVGqt2al23aOqdqS/tNNg8hzP/p8/IKOx5x0e49fjqrzMGX\nPpSfkXpl1IsNPVySc9uRjf2UPQAAAIDaCHbNIzOvW8vM1MJZ/6r12XTFnCeeeOLZF78KIeS3\nblvy2SuXnnXqnwbvu+0fNuxSVHT1Nz9/GUVGTpd/njc4/dXdG6zSetW+mxx4xNDr7vlnQz6E\nrkrdk9dt4/MPSKfLRj4+OYQw//t7b5s6b/2zRjZ6SYUrHbNdm9xnhz9bdQFOu//zTgMuylv0\n13PBzKcq0un3L94gqSGn9R9CCLPfn109LJVZVHOvzCTktP85/CWprJrPtllrr0UG53bfuW1u\nydRXGni47MJ+K2T5RwQAAAD8mnyGXXPJGL5yyzMmX//p/PNWz1v8Lsz9+pJddhmz6h4vTNqy\nywMnDdj70nGd1tl616022mXTHU46c+0pR2x7XI2vZ9hixK3TDjnl4Ycff/HlV1979pa7brh0\n6F82eviDcdvWeF1YtXTlIuGs3snr0Hr1M9Zv8bd3zvhH2O+UiVecn8oovOqAbo1YUrUxB3Xb\n7Lph08oOzJ925UuzFv7lvI0XH5HKDiGsNeKm6hfQVctp1ciXuS35sXOZSUhSOQ08XJIqaNxx\nAQAAAJZGsGs2B16w9el7P3jA2a+/dc4Wiz31yl/vDCFsOaJ36dw39r10XJedrv3y8SOqn725\nxsiy4o/HfziraO319jti2H5HDAshTHzqrN47jTrhtHcnXFMVvBb5ztOpb8+s/rneyeuRZF20\n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\nAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAA\nAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAA\nAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAA\nAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEA\nAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcA\nAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0A\nAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYA\nAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgB\nAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAH\nAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYId\nAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2\nAAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLY\nAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhg\nBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGC\nHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQI\ndgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi\n2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESI\n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\nZnz4+h0h7LfG0YSkhBDCGr86m5BWd9WjlBDCthc8eNNeTddYmFqnU8mDHhc8MnvAxc8//9K4\nd8dPeOPhJ0beds7Z3Z6f/PY+pT6UBwBAlfEJOwCg5jr6sRe2SE++8aBj5q4oWj2YVne/EMK3\nj39XeuaSn0aFEBr1bBTK9UfWrk/C3tmpy/Onr32gwe6tQwijP5tXenDm2P+uLKnegYmx2IoF\nHfYrpWePlgsWLIi1qhVCWL5k+kcfffRT7XZHDjrvnsee/+Lb3KmvXLV05odnXvrpHysYAICN\nJLADAGqu5IxtXx3ZJ3/e64c/MmP1YHrO3/o0qDXt3hM/mFNQMhJfkXt9//tjCamXH9yi/BP+\nkbXrlRiLFS37de3xnO2ub5iS+PpxZ07PW1EyUrjw81MumFjyOCmt3bCt63096rixM5euXvLk\naYf269fvh4QQQsib9c9u3bodMfy3eK7VjjuFEFasOhsAAFXMLbEAQI3Wtv8T5wx/89bJpT+e\nlvDPFy97fdehe7TtctyJvVtn5r/z7EP/mTp/r6Fje2anhhB+Hd+7/QFvtjz45clP9ljrfOtZ\n+0e0TE+KFy8Yv6hwt9//Um1iWus3bu6z/RlPd27d/Zij928YZr308KiF3Y4Krz1YMuGsV+4e\n2b7/AW079j6yV5ct6k1+a8yoN77adsCoYxrWCiHUaXXl3g3uG3t1jwP/d3y3bdoUL/ju+fsf\nTEyuP+y6zn+wYAAANo5P2AEANVzCVa/fm5X4u/8oarjzRV+9M6pPt8xnH7z18ptHzkjrdOVD\nb4+9Zq+So/GigiVLliwtKFrX2daz9o/Y6uiWIYQTTn127UPbnf7Uh49f26157hN3D79j1Gtt\nj7p50r/OW3008y9HTJr00gn7/uXdZx+47Oo7/jun3hUjX5344NElR2OJdV744s0hfXeb8urj\nV19y0a0j/52921H/+nj6Uc0z/3jNAABshFg87ifAAAAAACAqfMIOAAAAACJEYAcAAAAAESKw\nAwAAAIAIEdgBAAAAQIQI7AAAAAAgQgR2AAAAABAhAjsAAAAAiBCBHQAAAABEiMAOAAAAACJE\nYAcAAAAAESKwAwAAAIAIEdgBAAAAQIQI7AAAAAAgQgR2AAAAABAhAjsAAAA2cy91bhRbJSEh\nJadp+yMGXz9j6Yr1Lpw/Y9qMX/Mr9FqL/vdY97aNa9XbdWOL3UjFy+c2S0uKxWL3z8yr4pcu\n510qLpx546mHt2lUNzWj/jY77T/y9W9WHSl6/KqBXbdqkdWwzb59z/x0YeH65v/mgg5Nrvph\n8QbW1jQ1add7p5U/p15y4olfz9/AE1Z0R+Us2ZDNUmMJ7AAAANj8ZTY+ady4cePGjXvrjRdu\nubDf109d1aXj32YWFpe/avQBu/S66rMKvdCHgy6ekTV48ufP/IFiN8bMCWf8Whj+kpp02zWf\nV/FLl/MuPdB758uf+PbMGx8c/+bTx3ZeevIB29w6dX4I4dMbeh57zbOHnX/nK49cV/fTR/ba\ncUhRufNXKf7v6LNv/npWYTy+6be1bhXdUTlL1rdZarY4AAAAbNZe7NSwTqtrS4/kz3mneWpS\nl0s/KX/h3e3qbnXK+xV6ree2zml35DtrDC7Pm78BS1cUFlXopX7nzk4N6rS68JVerVLr7Lpi\n40+zMcp6l5bnTUlOiB337i+rBopOapzZdPfn4kX522Qkd7nm/0pG82aOCSFcMn1+mfPj8Xg8\n/u0zxzarm1YSZQz9buEG1tYkJXGXe74sf07dpIQTvsrdkLNVdEflLCl/s+ATdgAAANQ4aTk9\nHu7Tauo/h5U8zZ/9/qm9ezTOzkxKrdW64+7XPT0thHB6s6zBM+Z/ec8uGQ36ljVnDbe1rdt7\n6twZo/+amtUlhFAvOfGuH348t++ezVofG0JYsXT6Rcfs16xeZkpGnU579B3zeW7JqqapSZe+\n8WDnxlmpScmN2+1838dzPnnk/C2b1E3NzNm591lzl6/8GOCcz3vFYrFrf1zH3aArlk658Iu5\nXa4+qes1hyxbOOGaGQtXHogvW2NJ09Sk1bd/Ls+bcs4R+7bKqZXTYrvLnvx877rpQ75ZUP6S\n716756Cdtq6XkZrTrM2hpwxfVBRf410qbXneF9tst/3gTjmrBhL2bZheMDt36Zwnp+QtP/GE\nDiWjtRodsW/dtFdG/a+s+SVPGve45N9vjP9o/NPr/Ae6HuVuqsRHZ22b1fTU1U/nTBycmFR7\nev7v7puu6I7KWVL+ZkFgBwAAQE201SntCnJfLonDLtr1oGd+2fqBF8Z+Mv6Ns/Ypvqxf128L\nim6ZMevWttkdThw75/vHypqzxjlPn/zzk1vWb3P4a/NnTSgZ+ddJB9Y58Lx3PrgvhOLTunS/\n+73i4Q/9e/wrT+6f/cXRO2//3qKV33R2a+9bTnnwza8mTzg863+Dd9+2z+j4Q//5+J0xw758\n8a4jn/m2ZE56zsFDhgzpkpmy9l6+e/bMgnjKrb1b1tv62pZpSY9e9MEGvAHxc3bu8eiMRneO\neeupEeeNO2uX8YuWlb+gcNF72x18Wtj/7Ffe/fCpf5z3fw9feuBdU9d4l0pLb/D3Tz/9tGtW\ncsnTZfM/OO+r+due3r1gwdgQwm51UlfP3LV26uy3Z5c1v+RpWk6HLl267LBDxw3Y2sboeOFp\neTPvfX3+yjfh9bP/3XDHWzukJ/2RHZWzpPzNgsAOAACAmiitUb14PP5TYVEIodWgix946baD\neuzcaaddT77skuKixZ/mFaak10qLxRKS02vVSi1rzhrnTEqvlZYQS0hKr1Vr5c2bs1vfcfnx\nB23ZpvGib6+8b9r8f0x4/phDe3b964HXP/PfnVLnnHHj5JJpO9z+7MkH7tJu666X3t21ePmc\nl58Z3n27LbodNOSCFlm/vjenZE5ms0F33XXX/nVTw1r+OfS/dTtcvX1Gciwx66bujX585cy8\n4vV8y9uiH64bMXXh42Pv79Wz2169jn321VOWrW9JQe5ri4uKTx7cv1uXznv1HvzmM09fuH39\nNd6lsnzx8t27d+i5rPOpz5+85YqlC0MIzVMSVx9tnppYOD+vrPnlV1VZMpqcckDdtGGPfxNC\nKCr8+awPZvW6s1c58yu6o1D2pqp+s0SfwA4AAICaaNmc+bFYrCRkOeucUzPGP3Pj1ZcNPrH/\nXt37r3P+hsxZW7sBW5c8mD1hXHKtLY9tllHyNJaYdW67Oj8+M6XkaaNdV94amZydlpj6l21r\nrfxgV/2khPj6c7RXbvtxcfuB202ZMmXKlCkNBmyzPP+r8z+bW/6qmW+/lpy5w36r4r96Ww9Z\n714ym5999E5N+rRq3fOwY6646Z65Lbsfsmfj9a7Kn/nhaQdt0+mwoR1Ovvub8XdkJ8WS0rNC\nCL8W/vb5xJ8Li5Ky0suaX87Jc6f3X/37vxv+S69lGbKrehAAAAYISURBVHZCu8k3jAwh/PLW\nGQuTt7ilS4NK2VE5m6rQZqlRBHYAAADURNPum5FW98Cc5ISiZT8evEXzv1/15MLE+rsffPSd\nTz++9uQNmbNOteutvIM1Ho+H8Ls4JjExFo+veVNtCKGi/6s+bcRl8Xj8w3P279ixY8eOHfc8\n7vUQwr/PeWOdkwtWxX/FBcW/qyeWtM75pZckJOWM+vinL956qNdOzb9869F9OjU/4KJ1v8pq\nuV88vG3bHmNDzwnf/jTq6gEZCbEQQmr2niGEDxf/9vnE/y4ubPjXhmXNL0fddnfPXOW2Ntkh\nhEf67LN/v9+qKiwj7SxYVwy69blnLvn5zncWLht97jutet+VmbiOV6/ojsrZVEU3S41SZkMC\nAADA5mrZ/A9OePrbLc95IoQwf9q5r35f8GvBi42SE0IIS2evI4zbkDnla7hbj+VLr33817z+\nTTJCCPGiJbd+taD5oEr4RrYr7viyfscb535x/uqR5w5u1ff1s34tPLJJcggh5K762Yqls5+e\nv2Ll40Z77rp8yW1jFyzrmZ0aQlgwbUTpc65zyawJt17/XOHtN1+01a4HnhnC1Ht26Xz+BWH4\np2UVFi9adOjup6QPeGDSiGNKZ1EZDY/ZIv20kU99d8LpW4cQli1448V5+ecf37as+eWIJdZp\n1KhO6ZGCyf/3fv4bIewTQliRP33e8qJazdPL2VRpGY1P7FXv9AsffOazabk3vLbzH99ROUs2\nYrPUKAI7AAAANn9Fy76fMGFCCCFetOzHKR/cPuzaeY0PeP+KHUIIqfV3ihc/ffPocUP2bP3z\nlHeHnzs0hDD1m9mH1m+ZGAtLvv1q5swtMsqZs2EF1Gl95YntRwzerW/iPy7qUKfwX7ec8UFB\nwzeHbrvhW8j75YFLb5p84BXD98n+7dvilvx05wvz8o977ujSM/e87fii9sPOfPeXp/Zu3q12\n6uiB1x119+CU3KnXDjolIbYyHarb/vqTt3mg336DH7lpcFbe9KtOfz2EkBhCiKWWtSS14eI7\nbhmWm9148EFdYgu/+ceI6XU6nBtCWP0uNW6cU7qMhd9dPn7hspv2qP3Kyy+vHkzJ2nGfHo2e\nuKhb9wsOeKjdmN2bLLtjUP867QZcv2Xdhd+cVdb8DX+X9rhg5yWDbjn7n93775D90s0nJybX\nv2L3JiGWUtam1nDZwPZdzx+QVq/PmS2y1j5a0R2Vs2SnZtf/8c2yOYsDAADAZu3FTg1X/19w\nLJZUr3Hbv5189fQly1dPeO3Gwe2b56TVbrzz3v1fnbZg4E4tkpIzP1lc+OXdA+rXSq79l2PK\nmbPGaz23dU67I98peVw3KeGoafNWHypcPOX8o/ZuXCc9KS1z2x6Hj/5s5aEmKYl9ps4teTx3\nap+ktDarl9zdru5Wp7xf8nj2Z4eEEK75YVHpl3v7uPbJGdssWlH8+yqK9qmblrPd7fF4fPaH\n9+3VsVV6YkIIYdfj/9GvYa0TvsotmbQi/7uL++7ZpHZa4/a7PjFp2uqTl7Pk1VuGbNe6YXJi\nUk7T1vsdfcGUxYXxeLz0u1TaN2P2WDuFyNn6uXg8Hi8uvP/Co1rlZCWn19n54FM+mb9sPfNX\nWb70yxDC0O8Wruuf88ptPTz0uK1aN0lLz96qyz4j3vxx5btX9qbqJiWsfpw365EQQtcbJ63z\n1BXdUTlLNmSz1GSxeHw9314JAAAA/KnFi/Nn5cYb59RaPbIif9q9D449bOCpzVISQgh5v9yb\n1fzUTxYt2yEzuawlm4H1bmrxj3fUaXneuPl5PeqkVGVhsAaBHQAAANQ4xStyu9Zrkj7k/ifP\nPiQ577trjz1g9JJBsydeWd11VZ944bKiFSP2b3/dzMFzJ19S3dVQ0/mVWAAAAKhxEpLqvfnR\n403H37R960ZtOx04tWm/t969tLqLqk5LZ49KS864YHzx9c8Mru5awCfsAAAAAOKF0yZ+ltau\nUys3wxIBAjsAAAAAiBC3xAIAAABAhAjsAAAAACBCBHYAAAAAECECOwAAAACIEIEdAAAAAESI\nwA4AAAAAIkRgBwAAAAAR8v9lAtw3Th+g/AAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 600,
       "width": 840
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(cleaned_data, aes(rideable_type, fill=member_casual))+\n",
    "geom_bar(position=\"dodge\")+\n",
    "coord_flip()+\n",
    "labs(title=\"Distribution of types of Bike\", subtitle=\"Casual vs Member\", caption='Data from: August 2021-July 2022', x= \"Rideable Type\" , y='No. of Rides')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2758256f",
   "metadata": {
    "papermill": {
     "duration": 0.020385,
     "end_time": "2022-11-06T09:22:42.860769",
     "exception": false,
     "start_time": "2022-11-06T09:22:42.840384",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Note that:\n",
    "* Classic bike have the biggest volume of rides.\n",
    "* Member have a bigger preference for Classic bikes, also electric bikes.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5c4eab21",
   "metadata": {
    "papermill": {
     "duration": 0.020038,
     "end_time": "2022-11-06T09:22:42.900386",
     "exception": false,
     "start_time": "2022-11-06T09:22:42.880348",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Share\n",
    "\n",
    "Let's go through the main finds and try to arrive at a conclusion.\n",
    "\n",
    "What we know about the dataset:\n",
    "* The average duration of casual members is longer than annual member.\n",
    "* The annual member is 14% more than the casual member.\n",
    "* In all months we have more members' rides than casual rides.\n",
    "* There's a bigger volume of bikers in the afternoon.\n",
    "* Although classic bike and electric bike was used for more number of rides according to docked bikes.\n",
    "* The No. of rides of Casual member is increases in a weekend according to the annual member. but on the weekdays the vice-verse.\n",
    "\n",
    "### Act\n",
    "\n",
    "**Recommendations**\n",
    "\n",
    "* Casual rides could be offered discounted weekdays passes to increase their ridership on weekdays. Members could be offered discounted weekend passes to increase their ridership on weekend.\n",
    "* The average ride duration of casual rider is longer than annual members. So we should give offer, the more you ride the more you get discount on annual membership it will encourage the casual user to get attracted.\n",
    "* The marketing strategy and the ads campaign should aim at casual users during the weekend.\n",
    "* Releasing monthly or 6 month memberships will be great for increasing casual member convert into annual member. This monthly or 6 month membership will attract casual member during a peak month may to October.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "19f5177d",
   "metadata": {
    "papermill": {
     "duration": 0.020045,
     "end_time": "2022-11-06T09:22:42.939867",
     "exception": false,
     "start_time": "2022-11-06T09:22:42.919822",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 293.586701,
   "end_time": "2022-11-06T09:22:43.785433",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-11-06T09:17:50.198732",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
