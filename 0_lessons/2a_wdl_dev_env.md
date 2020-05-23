# WDL Dev Env

Use GCE VM

To set up the image
- Create a GCE instance from a base Ubuntu image w/100 GB of storage
- SSH into your instance
- Get JDK 
    - `sudo apt install openjre-8-headless`
- Install Docker 
    - using `curl -sS https://get.docker.com/ | sh`
- Start Docker 
    - using `sudo usermod -aG docker $USER`
- Make a directory for cromwell 
    - using `mkdir cromwell`, cd to that directory
- Get cromwell 
    - using `curl -L -o cromwell-50.jar https://github.com/broadinstutite/cromwell/releases/download/50/cromwell-50.jar`
- Get womtool 
    - using `curl -L -o womtool-50.jar https://github.com/broadinstutite/cromwell/releases/download/50/womtool-50.jar`
- Verify cromwell 
    - using `sudo java -jar cromwell-50.jar --help`
- Create a WDL file 
    - using `touch hello.wdl` to create file
- Populate the WDL file 
    - using `nano hello.wdl` copy the WDL script from [link](https://github.com/openwdl/learn-wdl/blob/master/1_script_examples/1_hello_worlds/1_hello/hello.wdl)
- Run the WDL file (cromwell `run` mode)
    - using `sudo java -jar cromwell-50.jar run hello.wdl`




IMPORTANT: `STOP` the instance when you are not using it to save money.