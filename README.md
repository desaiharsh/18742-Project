# 18742-Project

This repository contains the source files for the 18742 class project developed by Harsh Desai and Elliot Binder. 
The project implements an intermittently powered Image classification system.
It takes in an input image from a Gameboy Camera and sends the image to a Lenet CNN being accelerated on a TinyFPGA BX.
The goal is to evaluate the potential of reconfigurability in intermittently powered systems.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:

msp430-elf-gcc

mspdebug


### Installing

A step by step series of examples that tell you how to get a development env running

Compiling:

```
make bld/gcc/all CONSOLE=1
```

Upload:

```
mspdebug tilib "prog bld/gcc/[executable].out"
```

### References

[TinyFPGA BX User Guide](https://tinyfpga.com/bx/guide.html)

[TinyFPGA webpage](https://tinyfpga.com/)

[Gameboy Camera Reference Project](http://sophiateam.undrgnd.free.fr/microcontroller/camera/index.html)
