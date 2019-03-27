![EulerOS logo](logo.png "EulerOS logo")  

# EulerOS

EulerOS provides enhanced security, compatibility and easy-to-use features along with high reliability. It meets the increasing requirements of Linux OS in enterprise applications and provides a compelling choice of open IT platform for users. EulerOS integrates the advanced Linux technologies, delivers more value to enterprise users in terms of high capability, stability, usability and expansibility. And it helps you reallocate resources from maintaining the status quo to tackling new challenges.

## Operating System
Linux/Unix, Other V2.0

## High Lights
- Extreme Security: EulerOS is one of the most secure operating systems available, which provides variety of security technologies to prevent intrusions and protect your system.
- Carrier-class Reliability, Availability and Serviceability: EulerOS customers are able to provide carrier-class ultra-long-term reliability and stability to their users.
- High Performance: EulerOS has done a lot of optimization in the compilation, virtual memory, CPU scheduling, IO drive, network and file system and so on.

## License
EulerOS is released under the GPLv2. See the ```LICENSE``` file in this repository for more information.

## Release roadmap
EulerOS Docker image will release a new version according to its associated [ISO](https://developer.huawei.com/ict/cn/rescenter/CMDA_FIELD_EULER_OS?developlan=Other). Generally Docker image releases a new version every three months, one month after ISO releasing.

One can use the following steps to generate Docker images from ISO.
* download iso and mount it to `/mnt/iso`
* `export ISO_PATH=/mnt/iso`
*  download [scripts](scripts) into a proper dir, such as `~/images_scripts`
*  `cd ~/images_scripts && export RPM_ROOT=$(pwd)/rootfs`
*  export OS_VERSION such as `export OS_VERSION=2.3`
*  `bash generate.sh`

## Support Details
Huawei offers 8x5 Comprehensive Support
400 8828 000

## Resources
[Administrators Guide]http://developer.huawei.com/ict/en/doc/site-euleros-administrators-guide-en/index.html/en-us)

## End User License Agreement
By subscribing to this product you agree to terms and conditions outlined in the product End User License Agreement [EULA](http://developer.huawei.com/ict/en/site-euleros/article/privacy-policy) 

## Community Support
[zh_CN](http://developer.huawei.com/ict/forum/forum.php?mod=forumdisplay&fid=400257&page=)

## Committer and Maintainer Guideline
Every committer and maintainer should read this [guideline](CONTRIBUTING.md) before contributing to this repo.
