# pybind_example

to experiment with building and accessing c++ classes from within python.

This repo builds using a base docker container after installing required packages (e.g. gcc, cmake, ...). This container has python3.9 natively installed.

The container both installs and generates a wheel file. To get the wheel, one must manually move it out for now.

# How to build
run 'build.bat' on windows to build the container

# How to run
run 'run_container.bat' on windows to run the container via /bin/bash

```
[root@66f73ff2acb2 pybind_example]# python3
Python 3.9.18 (main, Sep  7 2023, 00:00:00)
[GCC 11.4.1 20230605 (Red Hat 11.4.1-2)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cwrap as c
>>> m = c.add(1,3)
>>> m
<cwrap.Msg object at 0x7f465f821e70>
>>> m.d.b
12.0
>>> c.printMsg(m)
'Value = 12.000000'
```