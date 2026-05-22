# MATLAB Control Systems

Collection of MATLAB labs and engineering exercises related to:
- Industrial drives
- System identification
- Motor modeling
- Friction estimation
- Numerical differentiation
- Dynamic system analysis

The repository contains coursework completed in robotics and automation engineering studies at THWS.

---

# Industrial Drives Lab

This lab focuses on analyzing servo motor behavior using measured trace data from industrial drive systems.

## Topics Covered

- Torque-speed characterization
- Load inertia estimation
- Friction modeling
- Numerical differentiation
- Least-squares parameter estimation
- Signal synchronization
- MATLAB data analysis and visualization

## Key Implementations

### Torque-Speed Analysis
Compared measured motor torque curves against manufacturer datasheet limits.

### Inertia Estimation
Estimated system inertia from angular acceleration and motor torque measurements.

### Friction Modeling
Modeled viscous and Coulomb friction using least-squares fitting.

### Signal Processing
Implemented reusable helper utilities for:
- trace synchronization
- numerical derivatives
- torque constant estimation

---

# Tools & Technologies

- MATLAB
- Industrial drive trace analysis
- Least-squares optimization
- Numerical modeling
- Data visualization

---

# Repository Structure

- `industrial-drives/`
  - MATLAB source code
  - trace datasets
  - generated plots
  - final report

- `control-systems/`
  - additional control engineering labs (in progress)

---

# Example Outputs

## Torque-Speed Characteristic
![Torque Speed](industrial-drives/figures/torque_speed_curve.png)

## Inertia Estimation
![Inertia](industrial-drives/figures/inertia_estimation.png)

## Friction Model
![Friction](industrial-drives/figures/friction_model.png)
