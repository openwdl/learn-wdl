## To Verify and Run 

#### List Input / Output Parameters

```
miniwdl run ./consensus-genome/update-run.wdl
```

#### Lint WDL

- Tip: Fix syntax errors

```
miniwdl check ./consensus-genome/update-run.wdl
```

#### Build Docker image

- run from top level path
````
docker build -t idseq-consensus-genome consensus-genome
````

#### Run Example

- Tip: Can use `--input` flag with `inputs.json` file rather than direct variable assignment
- Tip: remove `--verbose` flag to reduce log output
- Tip: can use `--debug` flag to increase log output

```
miniwdl run ./consensus-genome/update-run.wdl \
    docker_image_id=idseq-consensus-genome:latest \
    fastqs_0=./consensus-genome/tests/sample_sars-cov-2_paired_r1.fastq.gz \
    fastqs_1=./consensus-genome/tests/sample_sars-cov-2_paired_r2.fastq.gz \
    sample=sample_sars-cov-2_paired \
    -i ./consensus-genome/tests/local_test.yml
```

#### Viz Workflow Graph

- source code [here](https://github.com/chanzuckerberg/miniwdl/blob/842cb847cb09a4412cda6103c1b60ceb93b18a9c/examples/wdlviz.py)
- requires `graphiz` - install `pip install graphviz`

