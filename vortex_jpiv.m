% analyze vortex
% 2020.12.04 
% written by KIM

clear, clc, close all;
% condition
degree = 0;
area = 1;
clearanceRatio = 0.06;
time = 1 * 10^-3;

%% read data
rfname = ['center04_06_degree32_area2.jvc']; % << ファイルの名前を変えて　option + command + R を押すと自動的に渦度を算出してくれる！
data = dlmread(rfname, ' ');
no = data(:,1);
x = data(:,2); y = data(:,3);
u = data(:,4); v = data(:,5);

%% define size of x,y coordinate
xCountMin = min(x);
xCountMax = max(x);
yCountMin = min(y);
yCountMax = max(y);

xReshape = xCountMax/xCountMin;
yReshape = yCountMax/yCountMin;

x = x / 16;
y = y / 16;
u = u * 1/time;
v = v * 1/time;

xtest = reshape(x,[xReshape, yReshape]);
ytest = reshape(y,[xReshape, yReshape]);
utest = reshape(u,[xReshape, yReshape]);
vtest = reshape(v,[xReshape, yReshape]);

xtest = xtest.';
ytest = ytest.';
utest = utest.';
vtest = vtest.';

[curlz, cav] = curl(utest, vtest);
re = pcolor(curlz/3000);

re1 = colorbar();
re1.Limits = [-2 2];
re.EdgeColor = 'none';
% set(gca,'XTick',[], 'YTick', [])
axis equal

colormap(jet(4096))
shading interp;
grid off;


