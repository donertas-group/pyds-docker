# PyDS Docker
[![Latest Tag](https://ghcr-badge.egpl.dev/donertas-group/pyds-docker/latest_tag?trim=major&label=latest)](https://github.com/donertas-group/pyds-docker/pkgs/container/pyds-docker)
[![Image Size](https://ghcr-badge.egpl.dev/donertas-group/pyds-docker/size?tag=latest&label=image%20size)](https://github.com/donertas-group/pyds-docker/pkgs/container/pyds-docker)

An opinionated Python-based Docker image for data science and deep learning in bioinformatics.
The image is based on the NVIDIA PyTorch [Docker image](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch), and runs Ubuntu 22.04 and Python 3.10.12. Currently only AMD64 architectures are supported.

The following Python packages are included:
* `numpy`
* `scipy`
* `pandas`
* `sklearn`
* `torch`
* `matplotlib`
* `scanpy`

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