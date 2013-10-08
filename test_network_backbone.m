% This is test program of network backbone extraction
clear all;
tic
% NS{1} = [1 1 1;1 1 0;1 0 1];  % For accurate test
% NS{2} = [1 0 1;1 1 0;1 0 1];
% NS{3} = [1 0 0;0 1 1;0 1 1];
% NS{4} = [1 1 1;1 1 1;1 1 1];
% NS{5} = [1 0 1;0 1 0;1 0 1];

samplelength = 100;

disp('Generating test matrix');
h = waitbar(0,'Generating test matrix...');

for i=1:samplelength
    waitbar(i/samplelength,h,'Generating test matrix...');
    NS{i} = randint(4,4);
end
disp('Extracting backbones...');

[B p] = networkbackbones(NS,2,60);
toc