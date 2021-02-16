% 2021.01.04
% reynolds stress
% Written by KIM
%%
clear, clc, close all;

%% Experimental Condition -> 

% 平均［（変動速度）×（変動速度）］＝ 
% 平均［（（瞬時の速度）－（平均速度））×（（瞬時の速度）－（平均速度））］

% レイノルズ応力とは？
% 乱流状態においては小さいスケールの渦が多く存在する。これらの渦が流れに沿う面を通過する際に運動量を輸送する。レイノルズ応力とは、単位時間・単位面積当たりの運動量輸送量のことをいう。
% 運動量が輸送されると、この変化量に応じたせん断応力が面に対して作用する。この作用は、流れに対してあたかも流体の粘性が大きくなったかのような影響を及ぼす。

tic
ccount = 999;
z1 = ["0", "04"];
clearanceRatio1 = ["06", "05"];
area1 = ["1", "2", "3", "4"];
degree1 = ["00", "20", "32", "44", "56"];
time = 1.0 * 10^-3; %[s]

for a = 1:2
    z = z1(a);
    for b = 1:2
        clearanceRatio = clearanceRatio1(b);
        for c = 1:5
            degree = degree1(c);        
            for d = 1:4
                area = area1(d);
                
U2 = 0;
V2 = 0;
UV2 = 0;
z = num2str(z);
clearanceRatio = num2str(clearanceRatio);
area = num2str(area);
degree = num2str(degree);

%% load data
% load instant data 

% load average data
filename_avg = ...
    ['/Users/beomzukim/Documents/MATLAB/research/pivlab-result/center' z '_' clearanceRatio ...
    '/center' z '_' clearanceRatio '_degree' degree '_area' area '.txt']
    %(['C:/Users/KBZ/Documents/MATLAB/research/xy_reynoldsStress/kensyo/double' arm '/saverage' arm '.jvc'], k-1);    
    
data = dlmread(filename_avg, ',' , 3);      
x_avg = data(:,1); y_avg = data(:,2);
u_avg = data(:,3); v_avg = data(:,4);
u_avg(isnan(u_avg)) = 0;
v_avg(isnan(v_avg)) = 0;
x_avg = x_avg - 1;
y_avg = y_avg - 1;
x_avg = x_avg / 16;
y_avg = y_avg / 16;
xReshape = max(x_avg);
yReshape = max(y_avg);

u_avg = u_avg * 1/time;
v_avg = v_avg * 1/time;

for k1 = 0001:ccount
    str = sprintf('%04d',k1);

filename = ...
    ['/Users/beomzukim/Documents/MATLAB/research/data3_reynoldsStress/center' z '_' clearanceRatio ...
    '/degree' degree '/area' area '/center' z '_' clearanceRatio '_degree' degree '_area' area '_' str '.txt']
    
data = dlmread(filename, ',' , 3);  
    
x = data(:,1); y = data(:,2);
u = data(:,3); v = data(:,4);

%% u, v
u = u * 1/time;
v = v * 1/time;

u(isnan(u)) = 0;
v(isnan(v)) = 0;
%% calculate reynolds stress
U = u - u_avg;
V = v - v_avg;

U1 = U.*U;
V1 = V.*V;
UV1 = U.*V;

U2 = U2 + U1;
V2 = V2 + V1;
UV2 = UV2 + UV1;

end

%% calculate mean velocity
U3 = U2/ccount;
V3 = V2/ccount;
UV3 = UV2/ccount;
w = 850 .* (125*2*pi/60);

U4 = U3 ./ (w^2);
V4 = V3 ./ (w^2);
UV4 = UV3 ./ (w^2);

%% reshaping
uv_reshape = reshape(UV4,[yReshape, xReshape]);
u_reshape = reshape(U4,[yReshape, xReshape]);
v_reshape = reshape(V4,[yReshape, xReshape]);

uv_reshape(uv_reshape == 0) = NaN;
u_reshape(u_reshape == 0) = NaN;
v_reshape(v_reshape == 0) = NaN;

uv_reshape = flipud(uv_reshape);
u_reshape = flipud(u_reshape);
v_reshape = flipud(v_reshape);

%%
uv_reshape = uv_reshape * -1;
u_reshape = uv_reshape * -1;
v_reshape = uv_reshape * -1;

uv_reshape = rot90(uv_reshape,1);
u_reshape = rot90(u_reshape,1);
v_reshape = rot90(v_reshape,1);
uv_reshape = interp2(uv_reshape,2);
u_reshape = interp2(u_reshape,2);
v_reshape = interp2(v_reshape,2);

% abs (not sure)
uv_reshape = abs(uv_reshape);
u_reshape = abs(u_reshape);
v_reshape = abs(v_reshape);


%% figure
uv_result = pcolor(uv_reshape);
set(uv_result, 'EdgeColor', 'none');
set(gca,'xtick',[])
set(gca,'ytick',[])
colorMap = jet(256);
colormap(colorMap);
caxis([0 0.05]);
c = colorbar;
c.FontSize = 25;

s.FaceColor = 'interp';
saveas(gcf,['uv_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.png']);
% writematrix(uv_reshape, ['uv_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.xlsx']);
% xlswrite(['uv_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.xlsx'],uv_reshape)


u_result = pcolor(u_reshape);
set(gca,'xtick',[])
set(gca,'ytick',[])
colorMap = jet(256);
colormap(colorMap);
caxis([0 0.05]);
c = colorbar;
c.FontSize = 25;

set(u_result, 'EdgeColor', 'none');
saveas(gcf,['u_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.png']);
% writematrix(u_result, ['u_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.xlsx']);

v_result = pcolor(v_reshape);
set(gca,'xtick',[])
set(gca,'ytick',[])
colorMap = jet(256);
colormap(colorMap);
caxis([0 0.05]);
c = colorbar;
c.FontSize = 25;

set(v_result, 'EdgeColor', 'none');
saveas(gcf,['v_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.png']);
% writematrix(v_result, ['v_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.xlsx']);

close all;
            end
        end
    end
end

toc

close all;
