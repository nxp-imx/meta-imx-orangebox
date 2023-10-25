i.MX Linux Yocto Project BSP 6.1.36-2.1.0 OrangeBox
=============================================================

The following boards were tested in this release:

- NXP i.MX 8DXL EVK  REV B0

Quick Start Guide
-----------------
See the i.MX Yocto Project User's Guide for instructions on installing repo.

First install the i.MX Linux BSP repo:
```
$ repo init -u ssh://bitbucket.sw.nxp.com/imx/imx-manifest -b linux-langdale-internal -m orangebox.xml
```

Download the Yocto Project Layers:
```
$ repo sync
```

Run i.MX Linux Project Setup:
```
$ source ./sources/meta-imx-orangebox/tools/setup.sh  <build folder>
```

After this your system will be configured to start a Yocto Project build.

Build images
------------
Build the default i.MX image:

```
$ bitbake imx-image-core
```


