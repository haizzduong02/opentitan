#!/bin/bash
if [ -f /tools/Xilinx/Vivado/2024.1/settings64.sh ]; then
    source /tools/Xilinx/Vivado/2024.1/settings64.sh
    echo "? Vivado 2024.1 environment loaded"
    echo "  Vivado: $(which vivado)"
fi
