# README
<!-- [![Build Docker image](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml/badge.svg)](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml) -->

A Python-based Docker image for data science and deep learning.
The image is based on the NVIDIA PyTorch [Docker image](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch), and runs Ubuntu 22.04 and Python 3.10.12

The following Python packages are included:
* `numpy`
* `scipy`
* `pandas`
* `sklearn`
* `matplotlib + plotnine`

## Usage
TODO

## Build & Push to GHCR
Trigger the workflow using the GitHub CLI:
    
```bash
# Login to GitHub
gh auth login

# Trigger workflow
gh workflow run build-image.yml
```

<details>
  <summary>Or build locally</summary>
    
    ```bash
    # Build images
    docker build --platform linux/amd64 -t ghcr.io/donertas-group/rdev-docker:<tag>-amd64 .

    # Push images
    docker push ghcr.io/donertas-group/rdev-docker:<tag>-amd64
    ```

</details>


## Contact
Mark Olenik <mark.olenik@gmail.com>