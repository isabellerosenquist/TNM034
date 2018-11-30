function [H,peaks,lines] = MyHough(BW)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Hough transformation
[H, theta, rho] = hough(BW)

imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

%Find peaks

numpeaks = 5;
peaks = houghpeaks(H,numpeaks)
% figure
% imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% plot(theta(peaks(:,2)),rho(peaks(:,1)),'s','color','white');


%Find lines
lines = houghlines(BW,theta,rho,peaks)

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


end

