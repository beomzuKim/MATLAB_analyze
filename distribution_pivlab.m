%% Written by KIM
% ~ 2020.11.13    architecture
% ~ 2020.11.22    write degree 0 ~ 45
%   2020.11.23    write degree 90 ~ 315

%% Explain analysis condition
% 0, 45, 90 -> area1
% 135, 180 -> area2
% 315, 0 -> area4
% (up -> down) >> (hub -> disk edge)

clear all;
close all;
clc; tic;

%% center (x,y coordinate) z = 0, clearanceRatio = 0.06
% degree0
center0_06_degree00_area1 = [1126,953];
center0_06_degree00_area2 = [1130,106];
center0_06_degree00_area3 = [146,84];
center0_06_degree00_area4 = [110,946];

% degree20
center0_06_degree20_area1 = [1133,954];
center0_06_degree20_area2 = [1129,136];
center0_06_degree20_area3 = [77,137];
center0_06_degree20_area4 = [65,988];

% degree32
center0_06_degree32_area1 = [1174,917];
center0_06_degree32_area2 = [1052,102];
center0_06_degree32_area3 = [80,103];
center0_06_degree32_area4 = [72,968];

% degree 44
center0_06_degree44_area1 = [1141,919];
center0_06_degree44_area2 = [1130,108]; %<<
center0_06_degree44_area3 = [205,114];
center0_06_degree44_area4 = [182,950];

% degree 56
center0_06_degree56_area1 = [1076,967];
center0_06_degree56_area2 = [1074,106];
center0_06_degree56_area3 = [196,126];
center0_06_degree56_area4 = [186,940]; %<<

%% center (x,y coordinate) z = 0, clearanceRatio = 0.05
% degree0
center0_05_degree00_area1 = [1038,974];
center0_05_degree00_area2 = [1352,80];
center0_05_degree00_area3 = [198,93];
center0_05_degree00_area4 = [244,994];

% degree20
center0_05_degree20_area1 = [1198,998];
center0_05_degree20_area2 = [1188,48];
center0_05_degree20_area3 = [236,46];
center0_05_degree20_area4 = [241,998];

% degree32
center0_05_degree32_area1 = [1192,997];
center0_05_degree32_area2 = [1230,12];
center0_05_degree32_area3 = [278,22];
center0_05_degree32_area4 = [276,1000];

% degree 44
center0_05_degree44_area1 = [1213,989];
center0_05_degree44_area2 = [1210,50];
center0_05_degree44_area3 = [274,53];
center0_05_degree44_area4 = [274,996];

% degree 56
center0_05_degree56_area1 = [1218,986];
center0_05_degree56_area2 = [1213,49];
center0_05_degree56_area3 = [216,68];
center0_05_degree56_area4 = [218,998];

%% center (x,y coordinate) z = 0.4, clearanceRatio = 0.06
% degree0
center04_06_degree00_area1 = [1272,981];
center04_06_degree00_area2 = [1286,104];
center04_06_degree00_area3 = [265,130];
center04_06_degree00_area4 = [376,974];

% degree20
center04_06_degree20_area1 = [1318,978];
center04_06_degree20_area2 = [1318,112];
center04_06_degree20_area3 = [262,130];
center04_06_degree20_area4 = [256,992];

% degree32
center04_06_degree32_area1 = [1314,960];
center04_06_degree32_area2 = [1318,106];
center04_06_degree32_area3 = [348,119];
center04_06_degree32_area4 = [351,972];

% degree 44
center04_06_degree44_area1 = [1304,982];
center04_06_degree44_area2 = [1316,106];
center04_06_degree44_area3 = [350,116];
center04_06_degree44_area4 = [352,962];

% degree 56
center04_06_degree56_area1 = [1310,986];
center04_06_degree56_area2 = [1314,108];
center04_06_degree56_area3 = [188,122];
center04_06_degree56_area4 = [190,1000];


%% center (x,y coordinate) z = 0.4, clearanceRatio = 0.05
% degree0
center04_05_degree00_area1 = [1346,996];
center04_05_degree00_area2 = [1348,112];
center04_05_degree00_area3 = [200,118];
center04_05_degree00_area4 = [204,993];

% degree20
center04_05_degree20_area1 = [1352,994];
center04_05_degree20_area2 = [1354,110];
center04_05_degree20_area3 = [325,128];
center04_05_degree20_area4 = [326,1005];

% degree32
center04_05_degree32_area1 = [1333,997];
center04_05_degree32_area2 = [1338,109];
center04_05_degree32_area3 = [326,129];
center04_05_degree32_area4 = [322,1006];

% degree 44
center04_05_degree44_area1 = [1340,988];
center04_05_degree44_area2 = [1337,106];
center04_05_degree44_area3 = [276,128];
center04_05_degree44_area4 = [278,1006];

% degree 56
center04_05_degree56_area1 = [1262,996];
center04_05_degree56_area2 = [1270,122];
center04_05_degree56_area3 = [274,129];
center04_05_degree56_area4 = [280,989];

%% experimental condition
z = '0';
clearanceRatio = '05';
area = '3';
degree = '56';
observingDegree = (1/4)*pi;
time = 1.0 * 10^-3; %[s]
% degree2 = num2str(rad2deg(observingDegree));

startingPoint = [center' z '_' clearanceRatio '_degree' degree '_area' area]; %%<<<<< caution

%% read data
rfname = ['/Users/beomzukim/Documents/MATLAB/research/pivlab-result/center' z '_' clearanceRatio '/center' z '_' clearanceRatio '_degree' degree '_area' area '.txt']
data = dlmread(rfname, ',' , 3);

x = data(:,1); y = data(:,2);
u = data(:,3); v = data(:,4);

%% define size of x,y coordinate

x = x - 1;
y = y - 1;
x = x / 16;
y = y / 16;
u = u * 1/time;
v = v * 1/time;

xReshape = max(x);
yReshape = max(y);

xtest = reshape(x,[yReshape, xReshape]);
ytest = reshape(y,[yReshape, xReshape]);
utest = reshape(u,[yReshape, xReshape]);
vtest = reshape(v,[yReshape, xReshape]);

% xtest = xtest.';
% ytest = ytest.';
% utest = utest.';
% vtest = vtest.';

%% setting starting point
startingCoordinate = [int8(startingPoint(1)/16), int8(startingPoint(2)/16)];
center = [startingCoordinate(1), startingCoordinate(2)];

%% polar coordinate of x,y
if observingDegree == (6/4)*pi
    observingU = utest(:,startingCoordinate(1));
    observingV = vtest(:,startingCoordinate(1));
    observingU = flipud(observingU);
    observingV = flipud(observingV);
    
elseif observingDegree == (5/4)*pi % 45degree
    for count = 1 : 100
        observingU(count,:) = utest(center(2),center(1));
        observingV(count,:) = vtest(center(2),center(1));
        center(1) = center(1) - 1;
        center(2) = center(2) - 1;
        if center(1) == 0 || center(2) == 0
            break;
        end
    end
    
elseif observingDegree == (4/4)*pi % 90degree
    observingU = utest(startingCoordinate(2),:); 
    observingU = observingU.';
    observingU = flipud(observingU);
    observingV = vtest(startingCoordinate(2),:); 
    observingV = observingV.';
    observingV = flipud(observingV);
    
elseif observingDegree == (3/4)*pi % 135degree
    for count = 1 : 100
        observingU(count,:) = utest(center(2),center(1));
        observingV(count,:) = vtest(center(2),center(1));
        center(1) = center(1) - 1;
        center(2) = center(2) + 1;
        if center(1) == 0 || center(2) == yReshape
            break;
        end
    end
    
elseif observingDegree == (2/4)*pi % 180degree
    observingU = utest(:,startingCoordinate(1));
    observingV = vtest(:,startingCoordinate(1));

elseif observingDegree == (1/4)*pi % 225degree
    for count = 1:100
        observingU(count,:) = utest(center(2),center(1));
        observingV(count,:) = vtest(center(2),center(1));
        center(1) = center(1) + 1;
        center(2) = center(2) + 1;
        if center(2) == yReshape
            break;
        end
    end
    
    
    
elseif observingDegree == (7/4)*pi % 315degree
    for count = 1 : 100
        observingU(count,:) = utest(center(2),center(1));
        observingV(count,:) = vtest(center(2),center(1));
        center(1) = center(1) + 1;
        center(2) = center(2) - 1;
        if center(2) == 0 || center(1) == xReshape
            break;
        end
    end
    
else
    disp('ANALYSIS CONDITION IS NOT CORRECT!!')
end

%%
% when the observingDegree was 0,90,180 
if observingDegree == (6/4)*pi || ...
   observingDegree == (4/4)*pi || ...
   observingDegree == (2/4)*pi 
        for count = 1 : length(observingU)
            observingU(count,2) = 16 * count;
            observingV(count,2) = 16 * count;
        end
        
% 45,135,315
elseif observingDegree == (5/4)*pi || ...
       observingDegree == (3/4)*pi || ...
       observingDegree == (7/4)*pi || ...
       observingDegree == (1/4)*pi

        for count = 1 : length(observingU)
            observingU(count,2) = 16 * sqrt(2) * count;
            observingV(count,2) = 16 * sqrt(2) * count;
        end
end

observingU(:,3) = observingU(:,2) * (110*2*pi/60);
observingV(:,3) = observingV(:,2) * (110*2*pi/60);
U = observingU(:,1) ./ observingU(:,3);
V = observingV(:,1) ./ observingV(:,3);


%% figure

% 
% r = double(hub2) : (double(radius2)-double(hub2))/(length(U) - 1) : double(radius2);
% r =  16 * r.'; 
x1 = (0.3 : 0.7/(length(observingU) - 1) : 1).';
% % 
vtheta = U .* sin(observingDegree) ...
       - V .* cos(observingDegree);

vr = U .* cos(observingDegree) ...
   + V .* sin(observingDegree);

vtheta2 = rmmissing(vtheta);
vr2 = rmmissing(vr);

toc