# Simple R Project for Reproducible Research

This project demonstrates basic file organization and automation 
for reproducible analysis using R.

## Requirements

- R (>= 4.0)
- Docker (optional)

## Setup and run

The file `run.R` is an example of a "run" or "master" script that 
can be used to execute an end-to-end workflow. This is generally
done from a terminal/command prompt outside of RStudio (although
you can also execute the `run.R` script from within RStudio.

From the commandline:
```
Rscript run.R
```

This will:
1. Install required packages
2. Load and analyze the data
3. Output summary statistics to `output/summary_stats.csv`
4. Save a boxplot to `output/plot.png`

---

## Running with Docker (Optional)

This is intended to demonstrate the use of Docker for containerization.
The purpose of using Docker for reproducibility is that you can
ensure that anyone who runs your workflow is using the exact version
of software that you are. However, use of Docker is more complex.

To run this example, you will first need to [install Docker](https://docs.docker.com/engine/install/) for your operating system.

### Run using an existing Docker image

I have pre-built an image using the provided `Dockerfile`. With
Docker installed, from a command prompt or terminal run:

```
docker run  -v $(pwd):/project craigwillis/simple-r-project Rscript run.R
```

This will "pull" the image from DockerHub and execute it locally. 
The image will run as a sort of light-weight virtual machine. 
The `-v` flag tells Docker to mount the current directory into the 
container. Outputs generated during execution will be written to the
local directory.


### Build the image

To build the image locally:

```bash
docker build -t simple-r-project .
```

If you create a [DockerHub account](http://hub.docker.com/), you can also
"push" the image to the registry:
```
docker build -t your-username/simple-r-project .
docker push your-username/simple-r-project
```

Your can then run the analysis using your image

```bash
docker run  -v $(pwd):/project your-username/simple-r-project Rscript run.R
```

This will mount your local `output/` directory so you can access the results generated inside the container.
