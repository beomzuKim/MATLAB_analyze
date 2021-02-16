%% Written by KIM
% 2020.11.02
clear;clc;
close all;

tic
%% condition

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
                
z = num2str(z);
clearanceRatio = num2str(clearanceRatio);
area = num2str(area);
degree = num2str(degree);
%% read data

rfname = ['/Users/beomzukim/Documents/MATLAB/research/newVelocity/z' z '_c' clearanceRatio '_degree' degree '_area' area '.txt']
data = dlmread(rfname, ',' , 3);

x = data(:,1); y = data(:,2);
u = data(:,3); v = data(:,4);

%% data setting
x = x - 1;
y = y - 1;
x = x / 16;
y = y / 16;
% u = u * 1/time;
% v = v * 1/time;

xReshape = max(x);
yReshape = max(y);

xtest = reshape(x,[yReshape, xReshape]);
ytest = reshape(y,[yReshape, xReshape]);
utest = reshape(u,[yReshape, xReshape]);
vtest = reshape(v,[yReshape, xReshape]);

%% setting starting point
% observingPoint16 = [int8(observingPoint(1)/16), int8(observingPoint(2)/16)];
for i = 2:(yReshape - 1)
    for j = 2:(xReshape - 1)
    observingArea = [i,j]; % area where we want to observed -> coordinate
%         if oberservingArea(i,j)
%             continue;
%         end
        
%% define element of tensor
dx = 32;
dy = 32;

% search elements
dxu1 = utest(i, j - 1);
dxu2 = utest(i, j + 1);
dyu1 = utest(i - 1, j);
dyu2 = utest(i + 1, j);
dxv1 = vtest(i, j - 1);
dxv2 = vtest(i, j + 1);
dyv1 = vtest(i - 1, j);
dyv2 = vtest(i + 1, j);

dxu = dxu1 - dxu2;
dyu = dyu1 - dyu2;
dxv = dxv1 - dxv2;
dyv = dyv1 - dyv2;

tensor = [dxu/dx dyu/dy; dxv/dx dyv/dy];

%% check tensor element
% for count_x = 1:2
%     for count_y = 1:2
%         if tensor(count_x, count_y) == 0
%             continue;
%         end
%     end
% end

%% Joint p.d.f of A_ij events in the invariant space {Q, R}
p = -(tensor(1,1) + tensor(2,2));
q = tensor(1,1) * tensor(2,2) - tensor(1,2) * tensor(2,1);
w3 = tensor(2,1) - tensor(1,2);

xAxis = p; %/sqrt(w3^2);
yAxis = q; %/sqrt(w3^2);
pAxisTest(i,j) = p;
qAxisTest(i,j) = q;

pAxisTest1 = nonzeros(pAxisTest);
qAxisTest1 = nonzeros(qAxisTest);


    end
end

%% histogram 2D
% nbins = 25;
% figure;
% h1 = histogram(pAxisTest1,nbins);
% % xlim([-0.1 0.1]);
% 
% figure;
% h2 = histogram(qAxisTest1,nbins);
% 
% Pdensity = h1.Values;
% Pdensity2 = Pdensity ./ sum(Pdensity);
% Qdensity = h2.Values;
% Qdensity2 = Qdensity ./ sum(Qdensity);

%% histogram 3D
pSize = size(pAxisTest);
qSize = size(qAxisTest);

pAxisTest2 = reshape(pAxisTest,[pSize(1)*pSize(2)],1);
qAxisTest2 = reshape(qAxisTest,[qSize(1)*qSize(2)],1);
process = [pAxisTest2, qAxisTest2];
process(process==0) = NaN;

%% histogram figure
hist = hist3(process,[101,101],'CdataMode','auto');
[q1,q2] = hist3(process,[1000,1000],'CdataMode','auto');
xlabel('P','FontSize',16);
ylabel('Q','FontSize',16);
xlim([-0.15 0.15]);
ylim([-0.005 0.005]);

% figure;
% contour(q2{1},q2{2},q1);
% grid on;
% hold on;
% xx = linspace(-1, 1);


% yy = q2{1}.^2 ./ 4;
% plot(q2{1},yy, 'LineWidth', 2, 'color', 'r');

%% interpolation
[X,Y] = meshgrid(-50:50);
[Xq,Yq] = meshgrid(-100:0.5:100);
Vq = interp2(X,Y,hist,Xq,Yq);

[a,b] = find(Vq==max(max(Vq)));

% centering
o = 25;
a1 = a - o;
b1 = b - o; 
a2 = a + o;
b2 = b + o;

con = Vq(a1:a2,b1:b2);

c1 = -0.15: 0.3/(length(con)-1) :0.15
c2 = -0.005: 0.01/(length(con)-1) :0.005
%% contour setting
figure;
[M,c] = contour(c1,c2,con);
% c.LevelList = [min(c.LevelList):(c.LevelList(2)-c.LevelList(1))/2:max(c.LevelList)];
% c.LineWidth = 1;


%% reference line
hold on;
mode_x = -0.1 : 0.2/999 : 0.1
yy = mode_x.^2 ./ 4;
plot(mode_x,yy, 'LineWidth', 1, 'color', 'r');

set(gca,'FontSize',22)
referenceline = refline(0,0);
referenceline.LineWidth = 1;
referenceline.Color = 'r';
line([0,0],[0 0.005],'color','r','LineWidth',1);
xlim([-0.1 0.1]);
ylim([-0.004 0.004]);
xlabel('P','FontSize',22);
ylabel('Q','FontSize',22);

saveas(gcf,['tensor_z' z '_c' clearanceRatio '_degree' degree  '_area' area '.png']);

% % % %% graph setting
% % % xlabel('P','FontSize',16);
% % % ylabel('Q','FontSize',16);
% % % 
% % % xlim([-0.25 0.25]);
% % % ylim([-0.005 0.005]);
% % % grid on;
% % % hold off;
            end
        end
    end
end

close all;

%%
toc
