function V = VolumeCal(filename)
%VOLUMELOSS calculates loss relative to reference plain
%
% V = Volume
%
% information about x and y coordinates and resolution is retreaved from
% 'Selected_frame.txt' which is created by 'prepcoredata.m'
%
% Version 1.0 (24/04/2014)
% Version 1.1 (17/09/2014)
% Coded and developed by Jim van Belzen
% Modified by Heng Wang (07/04/2015)
% published under the Creative Commons Attribution Non-Commercial license 
% which allows users to read, copy, distribute and make derivative works 
% for noncommercial purposes from the material, as long as the author of 
% the original work is cited.
% This code comes with no warranties or support
% http://people.zeelandnet.nl/jbelzen/

on=1;
off=0;

V = [];


%% load data
Z=dlmread([filename,'_z.grid']);
xy_frame=dlmread('Selected_frame.txt');

%%- define selection in images used for comparison
xmin=xy_frame(1);
xmax=xy_frame(2); 
ymin=xy_frame(3);
ymax=xy_frame(4);
res=xy_frame(5);

%%- calc volume
V=sum(-Z(:))*(1/res)^2;


end

