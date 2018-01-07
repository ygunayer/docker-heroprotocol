# docker-heroprotocol
A Docker image that wraps Blizzard's [heroprotocol](https://github.com/Blizzard/heroprotocol/).

## Description
This repo contains a Python 2.7 based image that attempts to Dockerize Blizzard's heroprotocol, a tool that can be used to parse Heroes of the Storm replays.

Use this image if you do not want to install Python on your host machine, or to expose heroprotocol as a service to various kinds of projects you might think of (like creating a cluster of parsers to automate and scale up the parsing proces for a statistics website).

## Usage
If you're solely interested in parsing a replay file in your local machine, use the wrapper at [ygunayer/heroprotocol-wrapper](https://github.com/ygunayer/heroprotocol-wrapper) since it uses some sane defaults and will save you tons of time.

If you're interested in running this image as a service and need more details, refer to the following subsections.

### Basis
I opted to use [python:2.7-alpine](https://hub.docker.com/r/library/python/tags/2.7-alpine/) as the base image because heroprotocol requires Python 2.x and I wanted to create a smaller image. If required, a non-Alpine version of the image can also be released.

### Folder Structure
The original heroprotocol repository is cloned at `/data/heroprotocol`, so the entry point can be written as follows

```bash
$ python /data/heroprotocol/heroprotocol.py
```

For convenience, the image *optionally* expects two folders to be mounted: `/data/input/` for input, and `/data/output/` for output. When running as a standalone tool to parse any given file, you can simply navigate into the containing directory, mount it at `/data/input`, and run the image on the said file.

**Example (Windows)**
```bat
> cd HotS\Replays
> docker run --name heroprotocol --rm -it -w /data/input -v=%cd%:/data/input ygunayer/heroprotocol:latest python /data/heroprotocol/heroprotocol.py --details "Foo Bar.StormReplay"

{'m_cacheHandles': ['s2ma\x00\x00EU\x1f\x1b"\x8d\xdb\x1fr \\\xbf\xd4D\x05R\x87\x10\x0b\x0f9\x95\x9b\xe8\x16T\x81b\xe4\x08\x1e\xa8U\x11',
...
```

### Versioning
The original heroprotocol repository regularly receives updates on each patch, so to keep up with the changes I decided to use the same version numbers. See the [CHANGELOG](CHANGELOG.md) for each release.

## License
MIT
