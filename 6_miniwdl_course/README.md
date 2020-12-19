# Using miniwdl with WDL scripts

This folder contains course example script files for the miniwdl course for WDL.  There are companion screencasts on YouTube (playlist shown below) - [link](https://www.youtube.com/playlist?list=PL4Q4HssKcxYv1FQJUD6D1Cu0Q1O-_S1hM)

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/miniwdl-screencasts.png" width=600>

## Process 

Using miniwdl to run WDL scripts, you'll run jobs which follow the pattern shown below:
- input data and configuration files on a file system (local or cloud)
- output data and log files are stored on a file system (local or cloud)
- compute (or job analysis) runs on one or more machines
  - compute often runs on VMs (virtual machines - can be cloud-hosted, AWS, Azure, GCP...)
  - workflow tasks run from docker container images

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/miniwdl-dev.png" width=600>
