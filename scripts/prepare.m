% clean start
clear;
clc;

% change directory
cd ..

% create directory
mkdir('codegen');

% load system
load_system('models/fbw');
load_system('models/fbw_law_blending');

% export models / subsystems to R2019b version
Simulink.exportToVersion('fbw','codegen/fbw.slx', 'R2019b', 'BreakUserLinks', true);
Simulink.exportToVersion('fbw_law_blending','codegen/fbw_law_blending.slx', 'R2019b', 'BreakUserLinks', true);

% close system
close_system('fbw');
