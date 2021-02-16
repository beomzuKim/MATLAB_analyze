%% Written by KIM
% ~ 2020.11.13    architecture
% ~ 2020.11.22    write degree 0 ~ 45
%   2020.11.23    write degree 90 ~ 315
%   2021.01.03    get figure

%% Explain analysis condition
% 0, 45, 90 -> area1
% 135, 180 -> area2
% 315, 0 -> area4
% (up -> down) >> (hub -> disk edge)

clear all;
close all;
clc; tic;

%% experimental condition
z1 = ["0", "04"];
clearanceRatio1 = ["06", "05"];
area1 = ["1", "2", "3", "4"];
degree1 = ["00", "20", "32", "44", "56"];
time = 1.0 * 10^-3; %[s]
% degree2 = num2str(rad2deg(observingDegree));

for a = 1:2
    z = z1(a);
    for b = 1:2
        clearanceRatio = clearanceRatio1(b);
        for c = 1:5
            degree = degree1(c);        
            for d = 1:4
                area = area1(d);
                
z = num2str(z);
clearanceRatio = num2str(clearanceRatio);
area = num2str(area);
degree = num2str(degree);
%% read data
rfname = ['/Users/beomzukim/Documents/MATLAB/research/vortex/pivlab_mask_vorticity/z' z '_c' clearanceRatio '_degree' degree '_area' area '.txt']
data = dlmread(rfname, ',' , 3);

x = data(:,1); y = data(:,2);
u = data(:,3); v = data(:,4);

%% define size of x,y coordinate

x = x - 1;
y = y - 1;
x = x / 16;
y = y / 16;
% u = u * 1/time; %[px/s]
% v = v * 1/time; %[px/s]


xReshape = max(x);
yReshape = max(y);

xtest = reshape(x,[yReshape, xReshape]);
ytest = reshape(y,[yReshape, xReshape]);
utest = reshape(u,[yReshape, xReshape]);
vtest = reshape(v,[yReshape, xReshape]);

[curlz, cav] = curl(utest, vtest);
curlz = flipud(curlz);


% curlz = curlz./cav
curlz = rot90(curlz,1);
curlz2 = interp2(curlz,2);

% w = 255 * (125*2*pi/60);

curlz2 = curlz2 *3.5;




figure;
h = pcolor(curlz2);
shading interp;
c = colorbar;
w = c.LineWidth;
c.FontSize = 25;
colorMap = jet(256);
colormap(colorMap); 
set(h, 'EdgeColor', 'none');
set(gca,'xtick',[])
set(gca,'ytick',[])
lim = caxis;
caxis([-2 2]);

saveas(gcf,['vortex_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.png']);
% xlswrite(['vortex_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.xlsx'],curlz2)

            end
        end
    end
end

close all;

toc