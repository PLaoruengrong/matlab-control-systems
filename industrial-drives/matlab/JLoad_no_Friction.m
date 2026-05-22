%% Task 5
[data,names] = load_traces('JLoadWithoutFriction.trace');
omega = deg2rad(data(:,3));
Iq = data(:,4) / 1000;
alpha=num_derivative(omega,0.001);
kT=torqueconstant(Iq);
Mmotor=kT.*Iq;
time=data(:,1)/1000;
subplot(3,1,1);
plot(time, omega);
ylabel('ω(t) /rad/s');
title('Angular speed vs Time');
xlim([0.5 3]);
subplot(3,1,2);
plot(time, alpha);
ylabel('α(t) /rad/s^2');
title('Angular Acceleration vs Time');
xlim([0.5 3]);
subplot(3,1,3);
plot(time, Mmotor);
ylabel('Mmotor(t) /Nm');
xlabel('Time /s');
xlim([0.5 3]);
title('Motor Torque vs Time');

%% Task 6
alphaMax=max(abs(alpha));
timeIns=find(abs(alpha)>=(alphaMax/4));
J_t=Mmotor(timeIns)./alpha(timeIns);
J_mean=mean(J_t)
Mest_t=J_mean*alpha;
plot(time, Mest_t, 'b', 'DisplayName', 'estimated torque Mest');  % First plot (blue)
hold on;
plot(time, Mmotor, 'r--', 'DisplayName', 'measured torque Mmotor'); % Second plot (red dashed)
hold off;

xlabel('Time /s');
xlim([0.5 3]);
ylabel('Torque /Nm');
title('Filtered Estimated and Measured Torques vs Time');
legend show;
grid on;

JMotor = 0.205;
JLoad=(J_mean*10000)-JMotor
