[data,names] = load_traces('MaxAcc.trace');
n = data(:,3) / 6;
Iq = data(:,4) / 1000;
kT=torqueconstant(Iq);
Mmotor=kT.*Iq;
timeIns=find(Mmotor<0.2);
time=data(:,1)/1000;
keep=true(size(time));
keep(timeIns)=false;
Mmotor=Mmotor(keep);
n=n(keep);
startIdx = find(Mmotor > 3.0, 1, 'first');
Mmotor = Mmotor(startIdx:end);
n = n(startIdx:end);
% datasheet values
angular_speed_datasheet = [0, 1000, 2000, 2100, 3000, 4000, 5000];
torque_datasheet = [3.5, 3.5, 3.5, 3.5, 2.2, 1.15, 0]; 
torque_measured = [interp1(n, Mmotor, 0) interp1(n, Mmotor, 1000) interp1(n, Mmotor, 2000) interp1(n, Mmotor, 2100) interp1(n, Mmotor, 3000) interp1(n, Mmotor, 4000) 0];

figure;

% First subplot for the plot
subplot(2,1,1);

plot(angular_speed_datasheet, torque_datasheet, 'b', 'DisplayName', 'Mmax 230V 3AC');  % First plot (blue)
hold on;
plot(n, Mmotor, 'r--', 'DisplayName', 'Measured Peak Torque Mmotor'); % Second plot (red dashed)
hold off;
title('Measured and Maximum Torques vs. n');
xlim([0 6000]);
xlabel('Angular Speed / RPM');
ylabel('Torque / Nm');
legend show;
grid on;

% Lower subplot for table
subplot(2,1,2);
axis off;

% Define data
n_values = angular_speed_datasheet;               % e.g. [0 1000 2000 2100 3000 4000 5000]
M_datasheet = torque_datasheet;                   % e.g. [3.5 3.5 3.5 3.5 2.2 1.15 0]
M_measured = torque_measured;                     % your measured values

% Define layout
xStart = 0.02;
yStart = 0.9;
dx = 0.11;    % column spacing
dy = 0.07;    % row spacing

% Row labels
labels = {'n / RPM', 'Mmax 230V 3AC / Nm', 'Measured Torque / Nm'};
colors = {'k', 'b', 'r'};
rows = {n_values, M_datasheet, M_measured};

% Plot each cell
for row = 1:3
    text(xStart, yStart - (row - 1) * dy, labels{row}, 'FontWeight', 'bold', 'FontName', 'Courier', 'Color', colors{row});
    
    for col = 1:length(n_values)
        x = xStart + dx + dx * col;
        val = rows{row}(col);
        if row == 1
            str = sprintf('%d', val);  % integer for speed
        else
            str = sprintf('%.2f', val);  % 2 decimal places for torque
        end
        text(x, yStart - (row - 1) * dy, str, 'FontWeight', 'bold', 'FontName', 'Courier', 'Color', colors{row});
    end
end

annotation('rectangle', [xStart + 0.1, yStart - 3 * dy - 0.37, dx * (length(n_values)), dy * 2], ...
    'Color', 'k', 'LineWidth', 1);
