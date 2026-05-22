%% Task 7

[data,names] = load_traces('JLoadAndFriction.trace');
omega = deg2rad(data(:,3));
Iq = data(:,4) / 1000;
alpha=num_derivative(omega,0.001);
kT=torqueconstant(Iq);
Mmotor=kT.*Iq;
time=data(:,1)/1000;
subplot(3,1,1);
plot(time, omega, 'b', 'DisplayName', 'Original ω(t)');
ylabel('ω(t) /rad/s');
title('Angular speed vs Time');
xlim([3.5 7.5]);
subplot(3,1,2);
plot(time, alpha, 'b', 'DisplayName', 'Original α(t)');
ylabel('α(t) /rad/s^2');
title('Angular Acceleration vs Time');
xlim([3.5 7.5]);
subplot(3,1,3);
plot(time, Mmotor, 'b', 'DisplayName', 'Original Mmotor(t)');
ylabel('Mmotor(t) /Nm');
xlabel('Time /s');
xlim([3.5 7.5]);
title('Motor Torque vs Time');

%% Task 8

timeIns=find(abs(omega)<20);
keep=true(size(time));
keep(timeIns)=false;
omegaSync=omega(keep);
alphaSync=alpha(keep);
IqSync=Iq(keep);
MmotorSync=Mmotor(keep);
t_sync=time(keep);

subplot(3,1,1);
hold on;
plot(t_sync, omegaSync, 'r--', 'DisplayName', 'Sync ω(t)');
hold off;
legend show;
grid on;
xlim([3.5 7.5]);
subplot(3,1,2);
hold on;
plot(t_sync, alphaSync, 'r--', 'DisplayName', 'Sync α(t)');
hold off;
legend show;
grid on;
xlim([3.5 7.5]);
subplot(3,1,3);
hold on;
plot(t_sync, MmotorSync, 'r--', 'DisplayName', 'Sync Mmotor(t)');
hold off;
legend show;
grid on;
xlim([3.5 7.5]);

%% Task 9

A=[alphaSync omegaSync sign(omegaSync)];
coeff = A \ MmotorSync;
Mest_motor = A * coeff;
e = MmotorSync - Mest_motor;
E = sum(e.^2)
J = coeff(1)
KFric_omega = coeff(2)
KFric_0 = coeff(3)
plot(time, Mmotor, 'b', 'DisplayName', 'Original Mmotor(t)');
hold on;
plot(t_sync, Mest_motor, 'm-.', 'DisplayName', 'estimated Mmotor(t)');
hold off;
ylabel('Mmotor(t) /NM');
xlabel('Time /s');
xlim([3.5 7.5]);
title('Estimated and original Torques vs Time');
legend show;
grid on;

JMotor = 0.205;
JLoad=(J*10000)-JMotor