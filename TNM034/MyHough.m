function [BWrot] = MyHough(BW)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Hough transformation
step1 = 0.1;
[H, theta, rho] = hough(BW,'RhoResolution',1.0,'Theta',-90:step1:90-step1);

%Find peaks
numpeaks = 1;
peaks = houghpeaks(H,numpeaks);

%Find lines
lines = houghlines(BW,theta,rho,peaks);

%Get theta from all lines
myThetaArr = zeros(1,numel(lines));
for i = 1:numel(lines)
    myThetaArr(i) = lines(i).theta;
end

%Find range in theta 
thetaRange = range(myThetaArr);

%if theta is the same ( it should be!!)
theta = myThetaArr(1);
 
%create min-maxarray
minmax = zeros(1,2); 

%set theta-diff
if thetaRange == 0
    if(theta == -90)
        minmax(1,1) = theta(1)+step1;
        minmax(1,2) = theta(1);
    elseif(theta == 90)
        minmax(1,1) = theta(1)-step1;
        minmax(1,2) = theta(1);
    else
        minmax(1,1) = theta(1)-step1;
        minmax(1,2) = theta(1)+step1;
    end
% else
%     minTheta = theta(1)- thetaRange-1;
%     maxTheta = theta(1)+ thetaRange+1;
end

minTheta = min(minmax);
maxTheta = max(minmax);

%Calculate hough again in a smaller range
step = 0.01;
[H, theta, rho] = hough(BW,'RhoResolution',1.0,'Theta',minTheta:step:(maxTheta-step));

%find peaks
numpeaks = 1;
peaks = houghpeaks(H,numpeaks);

%find lines
lines = houghlines(BW,theta,rho,peaks);

%get rotation angle and determine rotation way
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


%Rotate image
BWrot = BW;
if range(diff_ang) == 0
    if myTheta == 0
        %BWrot = BW;
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


%show BW and rotated image
%figure
%imshow(BW);
%figure
%imshow(BWrot);


end

