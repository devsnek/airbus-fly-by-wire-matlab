% prepare clean environment
clear;
clc;

% clean start
clear;
clc;

% change directory
cd ../codegen

% load system
load_system('codegen/fbw');

% get configuration
config = getActiveConfigSet('fbw');

% set parameters
set_param(config, 'SystemTargetFile', 'ert.tlc');
set_param(config, 'GenCodeOnly', 'on');
set_param(config, 'TargetLang', 'C++');
set_param(config, 'PackageGeneratedCodeAndArtifacts', 'on');
set_param(config, 'RTWCompilerOptimization', 'on');
set_param(config, 'BuildConfiguration', 'Faster Runs')
set_param(config, 'DefaultParameterBehavior', 'Tunable')
set_param(config, 'GenerateReport', 'off')
set_param(config, 'GenerateComments', 'off')
set_param(config, 'StateflowObjectComments', 'on')
set_param(config, 'MaxIdLength', '128')
set_param(config, 'InternalIdentifier', 'Classic')
set_param(config, 'TargetLangStandard', 'C++03 (ISO)')
set_param(config, 'NewlineStyle', 'LF')
set_param(config, 'MaxLineWidth', '120')

% save system
save_system('fbw', [], 'OverwriteIfChangedOnDisk', true);
save_system('fbw_law_blending', [], 'OverwriteIfChangedOnDisk', true);

% start code generation
rtwbuild('fbw');

% close 'fbw'
close_system('fbw');

% clean up
rmdir('fbw_ert_rtw', 's');
rmdir('slprj', 's');
delete('fbw.slxc');

% restore directory
cd ..
