## Overview of CPU Modes:
### Real Mode:
- Bootloaders and BIOS routines typically start in Real Mode.
- Used for early initialization tasks before switching to more advanced modes.
### Protected Mode:
- Memory Protection: Each application runs in its own protected memory space, preventing accidental or malicious overwriting of other programs’ memory.
- Segmentation: Memory is divided into segments defined by segment descriptors.
- Paging: Allows virtual memory management, where physical memory is divided into pages.
- Privilege Levels: Rings (typically Ring 0 to Ring 3) define different privilege levels, with Ring 0 being the most privileged (kernel mode).
