function [BWrot] = MyHough(BW)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Hough transformation
[H, theta, rho] = hough(BW);

% figure
% imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;

%Find peaks

numpeaks = 1;
peaks = houghpeaks(H,numpeaks);
 
% figure
% imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% plot(theta(peaks(:,2)),rho(peaks(:,1)),'s','color','white');


%Find lines
lines = houghlines(BW,theta,rho,peaks);

figure 
imshow(BW);

hold on
for k = 1:numel(lines)
    x1 = lines(k).point1(1);
    y1 = lines(k).point1(2);
    x2 = lines(k).point2(1);
    y2 = lines(k).point2(2);
    plot([x1 x2],[y1 y2],'Color','g','LineWidth', 2)
end
hold off

% max_len = 0;
% for k = 1:length(lines)
%    xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%     
%    % Plot beginnings and ends of lines
%    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%    
%    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
%     
%            % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end
% 
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

diff_ang = zeros(1,numel(lines));


for i = 1:numel(lines)
    ang = lines(i).theta;
    if ang < 0 
        myTheta = ang+90;
        sign = -1;
    else 
        myTheta = 90-ang;
        sign = 1;
    end
    diff_ang(i) = myTheta;
end


%positiv - clockwise
%negativ - counter clockwise
%BWrot = imrotate(BW, -ang, 'bicubic');


if range(diff_ang) == 0
    if myTheta == 0
        BWrot = BW;
    else
        if sign == -1
        BWrot = imrotate(BW,myTheta, 'bicubic');
        else
            BWrot = imrotate(BW,-myTheta, 'bicubic');
        end
    end
else
    disp('Angle not the same');
end


figure
% subplot(1,2,1);
% imshow(BW);
% subplot(1,2,2);
imshow(BWrot);
%title('Rotationangle: '+ ang);


end

