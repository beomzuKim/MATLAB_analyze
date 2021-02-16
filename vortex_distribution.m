clear, clc, close all;

tic
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
z = ['0']; %["0", "04"];
clearanceRatio = ['05']; %["06", "05"];
area = ["1"];
degree2 = ["00", "20", "32", "44", "56"];
% time = 1.0 * 10^-3; %[s]

observingDegree = (5/4)*pi;

observingDegree2 = 0;

if observingDegree == (6/4)*pi
    observingDegreeMenu2 = '0';
elseif observingDegree == (5/4)*pi
    observingDegreeMenu2 = '45'; 
elseif observingDegree == (4/4)*pi
    observingDegreeMenu2 = '90';
elseif observingDegree == (3/4)*pi
    observingDegreeMenu2 = '135';
elseif observingDegree == (2/4)*pi
    observingDegreeMenu2 = '180';
elseif observingDegree == (1/4)*pi
    observingDegreeMenu2 = '225';
elseif observingDegree == (7/4)*pi
    observingDegreeMenu2 = '315';

end


for s = 1:5
    degree = degree2(s);


%% read data
rfname = ['/Users/beomzukim/Documents/MATLAB/research/vortex/vortex_distribution/uv_z' z '_c' clearanceRatio '_degree' degree '_area' area '.csv'];
rfname2 = strcat(rfname{1},rfname{2},rfname{3},rfname{4},rfname{5},rfname{6},rfname{7},rfname{8},rfname{9})
data_vortex = dlmread(rfname2);
data_vortex = flipud(data_vortex);
size1 = size(data_vortex);
xReshape = size1(2);
yReshape = size1(1);


centerName = ['center' z '_' clearanceRatio '_degree' degree '_area' area];
centerName2 = strcat(centerName{1},centerName{2},centerName{3},centerName{4},centerName{5},centerName{6},centerName{7},centerName{8})
startingPoint = eval(centerName2); 
%% setting starting point
startingCoordinate = [int8(startingPoint(1)/16), int8(startingPoint(2)/16)];
center = [startingCoordinate(1), startingCoordinate(2)];

% data_vortex = rot90(data_vortex,3);

%% polar coordinate of x,y
if observingDegree == (6/4)*pi % 0degree
    observingV = data_vortex(:,startingCoordinate(1));
    observingV = flipud(observingV);
    
elseif observingDegree == (5/4)*pi % 45degree
    for count = 1 : 100
        observingV(count,:) = data_vortex(center(2),center(1));
        center(1) = center(1) - 1;
        center(2) = center(2) - 1;
        if center(1) == 0 || center(2) == 0
            break;
        end
    end
    
elseif observingDegree == (4/4)*pi % 90degree
    observingV = data_vortex(startingCoordinate(2),:); 
    observingV = observingV.';
    observingV = flipud(observingV);
    
elseif observingDegree == (3/4)*pi % 135degree
    for count = 1 : 100
        observingV(count,:) = data_vortex(center(2),center(1));
        center(1) = center(1) - 1;
        center(2) = center(2) + 1;
        if center(1) == 0 || center(2) == yReshape
            break;
        end
    end
    
elseif observingDegree == (2/4)*pi % 180degree
    observingV = data_vortex(:,startingCoordinate(1));

    
elseif observingDegree == (1/4)*pi % 225degree
    for count = 1:100
        observingV(count,:) = data_vortex(center(2),center(1));
        center(1) = center(1) + 1;
        center(2) = center(2) + 1;
        if center(2) == yReshape
            break;
        end
    end
    
elseif observingDegree == (7/4)*pi % 315degree
    for count = 1 : 100
        observingV(count,:) = data_vortex(center(2),center(1));
        center(1) = center(1) + 1;
        center(2) = center(2) - 1;
        if center(2) == 0 || center(1) == xReshape
            break;
        end
    end
    
else
    disp('ANALYSIS CONDITION IS NOT CORRECT!!')
end


%% figure

observingV = rmmissing(observingV);
vortex = smoothdata(observingV,'loess');
leg1 = length(vortex);
xq = 0.3 : 0.7/39 : 1;
x0 = 0.3 : 0.7/(leg1-1) : 1;
vortex2 = interp1(x0,vortex,xq); 
vortex2 = vortex2;

vort = polyfit(xq,vortex2,10);
vort2 = (vort(1)*xq.^10)+ ...
       (vort(2)*xq.^9) + ...
       (vort(3)*xq.^8) + ...
       (vort(4)*xq.^7) + ...
       (vort(5)*xq.^6) + ...
       (vort(6)*xq.^5) + ...
       (vort(7)*xq.^4) + ...
       (vort(8)*xq.^3) + ...
       (vort(9)*xq.^2) + ...
       (vort(10)*xq.^1) + ...
       vort(11);

sig = [{'-o'}, {'-d'}, {'-s'}, {'-^'}, {'-*'}];
sig2 = char(sig(s));
plot(xq,vort2,sig2);
hold on;

end



% observingDegreeMenu2 = num2str(observingDegree2);
set(gca,'FontSize',22)
legend('0°','20°','32°','44°','56°');
legend('Location','northwest');


set(legend,'FontSize',18)
xlabel('r/R_2','FontSize',22);


ylabel('$-\overline {uv}$','FontSize',22, 'Interpreter','latex');
xlim([0.3 1]);
ylim([-0.01 0.15]);
% referenceline = refline(0,0);
% referenceline.LineWidth = 2;
% referenceline.Color = 'r';

saveas(gcf,['ReynoldsStress_' clearanceRatio '_z' z  '_measurementArea' observingDegreeMenu2 '.png']);

toc




