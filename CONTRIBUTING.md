## Introduction

Dear committer and maintainer. Thank you for investing the time and energy to help
make this project as useful as possible. Contributing or maintaining a project is difficult,
sometimes unrewarding work.  Sure, you will get to contribute cool
features to the project. But most of your time will be spent reviewing,
cleaning up, documenting, asking/answering questions, justifying design
decisions - while everyone has all the fun! But remember - the quality
of the contributing work is what distinguishes the good projects from the
great.  So please be proud of your work, even the unglamorous parts,
and encourage a culture of appreciation and respect for *every* aspect
of improving the project - not just the hot new features.

## What are a maintainer's responsibility?

It is every maintainer's responsibility to:

* Add a major release when there is a new EulerOS distribution.
* Add a minor release when there is any update, either CVE fixes or bug fixes.

## What could a committer and maintainer to?

* Make a stronger CI system.
* Make a better document.
* Anything to make a solid base image.

## How to create the base image

* Use the [composer](https://github.com/isula/isula-composer) to generate a `*.tar.xz` file
* Add a Dockerfile, take [2.2](2.2/Dockerfile) for example.
* Generate a sha256/md5 file for users to verify the image consistency.
* Open a PR on the related projects in [docker-library](https://github.com/docker-library),
follows the [instruction](https://docs.docker.com/docker-hub/official_repos/)


## How are decisions made?

All decisions affecting this project, big and small, follow the same 3 steps:

* Step 1: Open a pull request. Anyone can do this.

* Step 2: Discuss the pull request. Anyone can do this.

* Step 3: Accept (`LGTM`) or refuse a pull request. The relevant maintainers do 
this (see below "Who decides what?")

## I'm a maintainer, should I make pull requests too?

Yes. Nobody should ever push to master directly. All changes should be
made through a pull request.

## Who decides what?

All decisions are pull requests, and the relevant maintainers make
decisions by accepting or refusing the pull request. Review and acceptance
by anyone is denoted by adding a comment in the pull request: `LGTM`.

## How are maintainers added?

Unlike other projects, `euleros-docker-images` is more like a product release project.
It is not possible to evaluate anyone by his/her contributions to this project.
So we will discuss it by open a PR.

## What is expected of committers and maintainers?

* Be cautious: Follow all the docker official repository requests and 
provide good documents.

* Lazy: Make maximized usage of CI. Now we are using docker test scripts, we can have ours.

* Craftsman spirit: Provide secure images, remove all the useless files.



