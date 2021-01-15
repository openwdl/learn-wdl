## To Verify and Run 

#### List Input / Output Parameters

```
miniwdl run ./consensus-genome/update-run.wdl
```

#### Build Docker image

- run from top level path
````
docker build -t idseq-consensus-genome consensus-genome
````
- verify image, you should see something like what is below.  Your IMAGE ID and CREATED (time) will vary.
````
docker images
````

REPOSITORY - TAG - IMAGE ID - CREATED - SIZE  
idseq-consensus-genome - latest - c7b5e4b30e97 - 22 hours ago - 1.8GB  

---

#### Run Example

- run with sample files

```
miniwdl run ./consensus-genome/update-run.wdl \
    docker_image_id=idseq-consensus-genome:latest \
    fastqs_0=./consensus-genome/tests/sample_sars-cov-2_paired_r1.fastq.gz \
    fastqs_1=./consensus-genome/tests/sample_sars-cov-2_paired_r2.fastq.gz \
    sample=sample_sars-cov-2_paired \
    -i ./consensus-genome/tests/local_test.yml
````
- Tip: Can use `--input` flag with `inputs.json` file rather than direct variable assignment
- Tip: remove `--verbose` flag to reduce log output
- Tip: can use `--debug` flag to increase log output

---

## Other Things to Try

#### Lint WDL

- Tip: View (& fix!) WDL syntax errors and warnings

```
miniwdl check ./consensus-genome/update-run.wdl
```

#### Use Caching

- Tip: Try out `call cache` and `download cache`.  Read about caching capabilities - [link](https://miniwdl.readthedocs.io/en/latest/runner_reference.html#call-cache)

````
miniwdl configure
````


#### Viz Workflow Graph

- source code [here](https://github.com/chanzuckerberg/miniwdl/blob/842cb847cb09a4412cda6103c1b60ceb93b18a9c/examples/wdlviz.py)
- requires `graphiz` - install `pip install graphviz`

