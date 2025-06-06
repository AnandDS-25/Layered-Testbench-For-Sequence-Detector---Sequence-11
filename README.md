# Layered Testbench for Sequence Detector - 11

This project implements a sequence detector that identifies the binary pattern `11` using a layered SystemVerilog testbench. The testbench architecture is inspired by UVM and separates functionality into clear modules:

- **Generator**: Produces input sequences
- **Driver**: Applies inputs to the DUT
- **Monitor**: Observes and collects DUT output
- **Scoreboard**: Validates output correctness

## 🔧 Files
- `design.sv` – Sequence detector design
- `testbench.sv` – Top-level testbench
- `generator.sv`, `driver.sv`, `monitor.sv`, `scoreboard.sv` – Layered components

## ✅ Features
- Pattern detected: `11`
- Modular and scalable testbench structure
- Easy to expand for different patterns


## 📁 Output
The output shows when the pattern `11` is detected in the input stream.
