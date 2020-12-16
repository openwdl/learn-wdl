# Production WDL Pipelines

---

## WARP

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/WARP-pipelines.png" width="600" align="right">

WARP (WDL Analysis Research Pipelines) repository is a collection of cloud-optimized pipelines for processing biological data from the Broad Institute Data Sciences Platform and collaborators.  

WARP pipelines provide robust, standardized data analysis for the Broad Institute Genomics Platform and large consortia like the Human Cell Atlas and the BRAIN Initiative. You can count on WARP for rigorously scientifically validated, high scale, reproducible and open source pipelines.  


- From The Broad Institute - GitHub repo 'WARP' WDL pipelines- https://github.com/broadinstitute/warp
- As above - documentation for WARP WDL Pipelines - https://broadinstitute.github.io/warp/documentation/Intro.html
- Types of WARP pipelines - see summary graphic below

---

## Viral Pipelines

<img src="https://github.com/openwdl/learn-wdl/blob/master/images/viral-methods.png" width="380" align="left">  

### WDL Viral Pipeline from The Broad 

  - WDL Viral pipeline examples from The Broad - [link](https://github.com/broadinstitute/viral-pipelines)  
  - Documenation for WDL Viral pipelines - [link](https://viral-pipelines.readthedocs.io/en/latest/workflows.html)
  - Descriptions of the methods - [link](https://viral-pipelines.readthedocs.io/en/latest/workflows.html) and shown to the left in the diagram
  - Pipeline examples are shown running using the miniwdl tool
  
 ---
 
 ###  RNA-seq Pipeline
  - A [BioWDL pipeline](https://biowdl.github.io/RNA-seq/v4.0.0/index.html) for processing RNA-seq data, starting with FASTQ files to produce expression measures and VCFs.
  - This pipeline can be used to process RNA-seq data, starting from FastQ files. It will perform the following tasks...
    - quality control (using FastQC and MultiQC) 
    - adapter clipping (using cutadapt) 
    - mapping (using STAR or HISAT2) 
    - expression quantification and transcript assembly (using HTSeq-Count and Stringtie) 
    - variant calling (based on the GATK Best Practises) and lncRNA detection (using CPAT) -- optional tasks
    
---


### Use miniwdl

- To use miniwdl, set up miniwdl dev env, see `vcf_chrom_counter.wdl` example  
- Use command below (downloads input data on execution)

```bash
miniwdl run vcf_chrom_counter.wdl \
  vcf_gz=https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh38/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz \
  tbi=https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh38/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz.tbi \
  --verbose
```





