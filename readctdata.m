
% [N,t,s] = readctdata(filename, channel)
% N is the sinogram with number of detected photons, 
% t is the vector of projection angles, 
% s is a vector = [d r] 
% where d = angular step size and r = radial step size


function [N,t,s] = readctdata('ctdata666', channel)

fid=fopen('ctdata666.dat');
[q,count] = fscanf(fid,'%f %d %d %d %d %d %d %d %d %d %d %d',[12 inf]);
q = q';
fclose(fid);
theta = q(:,1);
data = q(:,channel+3);
rho = q(:,2);

rho(72)

a = theta(1);
temp = [];
N = [];
t = [0]; 

% Sorting the data set, data for one angle in
% each column of the matrix N. Row vector t 
% contains the different angles.

for i = 1:length(theta)
    if a == theta(i)
        temp = [temp data(i)];  
    end
    if  theta(i) ~= a || i == length(q)
        a = theta(i);
        if i < length(q)
            t = [t a];
        end 
        N = [N  temp'];
        temp = data(i);
    end
end

d = diff(t); d = d(1);
r = diff(rho); r = r(1);
s = [d r];