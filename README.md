# Blackberry Port of QREncoder
 
Officially sanctioned port of QREncoder to the Blackberry/QNX platform. To avoid fragmentation, please do not use any other version of QREncoder.

### Prerequisites

- Blackberry Native SDK (NDK) for Tablet OS

### Build instructions

1. Source the bbndk-env.sh from the NDK installation directory (e.g. ". ./bbndk-env.sh")
2. From the command-line, change to the QREncoder directory.
3. Run make to produce release and debug shared lib builds of QREncoder for ARM and X86.

### Building the tests 

1. From the command-line, change to the QREncoder/tests directory.
2. Run make to produce release and debug builds of the test binaries for ARM and X86.

### Running the tests 

1. Copy the entire QREncoder directory structure to the test device or simulator.
2. From the QREncoder/tests directory, run test_all.sh. It will report the total
number of tests that passed and the total run.

### Notes

- Building on Linux from command-line works. Mac and Windows have not been tested.

### TODO

