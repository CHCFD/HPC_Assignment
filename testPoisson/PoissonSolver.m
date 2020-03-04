%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Solve Poisson equation to check
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
tic
nx = 120;
ny = 120;
Lx = pi;
Ly = pi;

dx = Lx/(nx-1);
dy = Ly/(ny-1);

kx = nx - 2;
ky = ny - 2;

A = eye(kx) * (2/dx^2)...
    + diag(ones((kx)-1,1), -1)/-dx^2 ...
    + diag(ones((kx)-1,1), 1)/-dx^2;

A = kron(eye(kx,kx),A) + kron(A, eye(kx,kx));

for i=1:kx
    for j=1:ky
        f(j+(i-1)*kx) = sin(i*dx)*sin(j*dy);
    end
end

sol = A\f';

solD = reshape(sol,[kx,ky]);
fD = reshape(f,[kx,ky]);

[xx,yy] = meshgrid(linspace(dx,Lx-dx,kx),linspace(dy,Ly-dy,ky));

surf(xx,yy,fD);
figure;
surf(xx,yy,solD);
toc