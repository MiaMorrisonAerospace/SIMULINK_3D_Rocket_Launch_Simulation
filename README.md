# SIMULINK_Rocket_Launch_Simulation


Project Preview
-
<table align="center">
<tr>

<td align="center" width="50%">

# Rocket Animation

https://github.com/user-attachments/assets/2ca21cf0-b210-441a-94a1-1940e6c4d923

</td>

<td align="center" width="50%">

# Simulink Model

<img src="https://github.com/user-attachments/assets/32ec6eb4-ff2c-4019-949b-79d6707ab741" width="500">

</td>

</tr>
</table>

Project Objective
-
The goal of this project was to strengthen my understanding of MATLAB and Simulink by building a complete rocket launch simulation from scratch using concepts from my aerospace engineering coursework, including Newton's Second Law, Euler angles, rotation matrices, and numerical integration—to model a simplified three-dimensional rocket launch and create a custom animation of the results.

Project Overview
-
This project simulates a rocket launching from a stationary launch pad using a simplified three-dimensional flight model. The simulation calculates the rocket's trajectory throughout flight by modeling the major forces acting on the vehicle while tracking its orientation using a 3-2-1 (yaw-pitch-roll) Euler angle rotation sequence. A rotation matrix is then used to transform the thrust vector from the rocket body frame into the inertial reference frame.

After the simulation runs in Simulink, the results are exported into MATLAB where a custom animation visualizes the rocket's flight path, orientation, and real-time flight telemetry.

---

Physics Modeled
-
- Constant engine thrust
- Variable rocket mass during fuel burn
- Gravity
- Aerodynamic drag
- Three-dimensional translational motion
- 3-2-1 (Yaw-Pitch-Roll) Euler angle rotation sequence
- Euler angle attitude dynamics
- Rotation matrix for body-to-world frame transformations
- Numerical integration of acceleration, velocity, and position

---

Simulink Model Organization
-
The model is organized into the following sections:

- **Rocket Parameters** – Defines vehicle properties, initial conditions, and simulation constants.
- **Mass Model** – Calculates the rocket mass as fuel is consumed.
- **Attitude Dynamics** – Computes Euler angle rates, integrates the vehicle orientation, and generates a 3-2-1 (yaw-pitch-roll) rotation matrix.
- **Force Model** – Calculates thrust, drag, and gravitational forces before summing the total force acting on the rocket.
- **Translational Dynamics** – Uses Newton's Second Law to calculate acceleration before integrating velocity and position.
- **Outputs** – Exports simulation data to MATLAB for visualization.

---

MATLAB Animation Features
-
- 3D rocket launch animation
- Animated flight trajectory
- Rocket orientation vector
- Launch pad visualization
- Real-time flight telemetry

---

Skills Demonstrated
-
- MATLAB programming
- Simulink modeling
- Aerospace coordinate transformations
- Dynamic system simulation
- Engineering data visualization

---

What I Learned
-
Through this project I gained hands-on experience building dynamic engineering simulations in Simulink rather than solving problems analytically. I learned how to organize large Simulink models, create MATLAB Function blocks, integrate differential equations, transform vectors between coordinate frames using rotation matrices, and animate simulation results in MATLAB. This project also reinforced many of the flight dynamics concepts I've learned in my aerospace engineering courses.

---

Future Improvements
-
- Model atmospheric density changes with altitude
- Implement a variable thrust profile
- Add full rotational dynamics using moments of inertia
- Implement a closed-loop guidance and control system
- Improve the rocket visualization with a custom 3D model

---

Software Used
-
- MATLAB
- Simulink
