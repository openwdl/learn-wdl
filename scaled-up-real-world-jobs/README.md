# About these samples

These samples are from this Repo - https://github.com/biowdl/pipeline-template

##  Pipeline-template

This repository contains a copy of the [Biowdl](https://github.com/biowdl) 
multisample pipeline template data.

The structure:
- A pipeline that 
   - executes jobs over all Samples, then 
   - starts the scatters per Sample, --or-- 
   - executes jobs per sample then
   - starts the scatters per Library 
   - executes jobs per Library, --or--
   - then starts the scatters per ReadGroup, then 
   - executes jobs per ReadGroup

The `Samples.wdl` file shows how Samples, Libraries and ReadGroups are related using a `samples.yml` file.

## Documentation

You can find the documentation [here](https://biowdl.github.io/).

## About
This pipeline is part of [Biowdl](https://github.com/biowdl),
developed by the SASC team at [Leiden University Medical Center](https://www.lumc.nl/). 
