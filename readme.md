# fastqc WDL
Run fastqc on a bunch of fastq files. If running on miniwdl, you **must** specify `--copy-input-files` or else your reports will be mostly blank.

Dockstore link: [https://dockstore.org/workflows/github.com/aofarrel/fastqc-wdl/fastqc](https://dockstore.org/workflows/github.com/aofarrel/fastqc-wdl/fastqc)

The test data provided in this repo is downsampled to an extreme degree and should not be used for real analysis. Download the original from SRA instead -- might we recommend trying [SRANWRP](https://dockstore.org/workflows/github.com/aofarrel/SRANWRP/pull_FASTQs_from_SRA_by_biosample:main?tab=info)?