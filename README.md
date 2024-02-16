# README
<!-- [![Build Docker image](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml/badge.svg)](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml) -->

A Python-based Docker image for data science and deep learning.
The image is based on the NVIDIA PyTorch [Docker image](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch), and runs Ubuntu 22.04 and Python 3.10.12. Currently only AMD64 architectures are supported.

The following Python packages are included:
* `numpy`
* `scipy`
* `pandas`
* `sklearn`
* `torch`
* `matplotlib + plotnine`

## Usage
To build from this image use the following as the first line of your Dockerfile:
```Dockerfile
FROM ghcr.io/donertas-group/pyds-docker:latest
...
```

## Build & Push to GHCR
The preferred way of building the image is manually. Set an appropriate `TAG` in the `Makefile` and do:

```bash
# Build and push images
make all
```

Pushing to GHCR requires a login, which can be achieved via a Github Token, see the [Github docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry) for token creation.
Once created do

```bash
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Contact
Mark Olenik <mark.olenik@gmail.com>