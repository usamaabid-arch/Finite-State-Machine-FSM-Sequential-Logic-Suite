# Finite State Machine (FSM) & Sequential Logic Suite

## Overview
This repository contains a collection of Verilog modules demonstrating fundamental sequential logic design. It includes various Finite State Machines (FSMs) and a custom counter, complete with testbenches for functional verification. 

## Included Modules

### 1. Vending Machine Controller (`task1`)
A Moore FSM that simulates a basic coin-operated vending machine.
* **Functionality:** Accepts inputs representing 5-unit (`co5`) and 10-unit (`co10`) coins. 
* **Dispensing Logic:** The machine dispenses a product (`can_dispense = 1`) once the accumulated total reaches 15 units or more. The state machine tracks combinations of inputs and resets accordingly after dispensing.

### 2. Decade Counter (`counter`)
A synchronous 4-bit counter with an active-low reset.
* **Functionality:** Counts upwards from `0000` (0) to `1001` (9) on each positive clock edge. 
* **Rollover:** Upon reaching 9, the counter wraps cleanly back to 0, functioning as a standard BCD/decade counter.

### 3. "1011" Sequence Detector (`task2`)
A Moore FSM designed to parse a serial data stream and detect a specific pattern.
* **Functionality:** Monitors the `in_steam` input bit by bit on each clock cycle.
* **Detection:** Asserts the output `Z` high for one clock cycle immediately after successfully detecting the non-overlapping sequence `1011`. 

### 4. Consecutive Pattern Detector (`task3`)
A Moore FSM that detects sustained logic levels in a serial stream.
* **Functionality:** Monitors the input `B`. 
* **Detection:** The output `Z` asserts high if the machine detects either **three consecutive 1s** or **three consecutive 0s**. It remains high as long as the consecutive pattern continues, resetting only when the stream toggles to the opposite logic level.

## Verification
Each RTL module is paired with a directed testbench (`*_tb.v`). The testbenches generate the clock stimuli, apply precise reset sequences, and feed directed vectors (like specific coin combinations or serial bitstreams) to verify corner cases and ensure correct state transitions.
