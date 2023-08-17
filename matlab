clear all
close all
n = 10;
xi = linspace(-1,1,n);
% n=length(xi);
x = linspace(-1,1,1000);
yi = [3 2 2 1 0 -3 -4 1 2 4];
lagrange(xi,yi,x);
function [val] = lagrange(xi,yi,x)
n=length(xi);
% Function for performing lagrange interpolation
% INPUT
%   x       interpolation points
%   f       function values
%   y       evaluate the interpolation polynomial at points y

%
%    n = length(xi);
%
% if x is a row vector, transform it to a column vector
%

if size(xi,1)==1
    xi = xi';
end
%
% compute weights using the interpolation points
%
% n = 10


for j=1:n
    dif = xi(j) - [xi(1:j-1);xi(j+1:n)];
    %dif=[xi(1:j-1);xi(j+1:n)]
   % xi(j)
    w(j) = 1/prod(dif);
end

m = length(x);
val = zeros(m,1);
%
%  evaluate the interpolation polynomial at y
%


xi = linspace(-1,1,10);
n=length(xi);


for i = 1: m
    sum=0;
    for j=1:n
        % CODE TO WRITE
            out=x(i)-[xi(1:j-1);xi(j+1:n)];
            v(j)=prod(out)*w(j);
            sum=sum+yi(j)*v(j);
            % sum = sum+y(i)*v(j);
            %-
            %out= [xi(1:j-1);xi(j+1:n)]
    end
    val(i)=sum;
end
end
% %% Examples
% if 0
%     clear all
%     close all
%     n = 10
%     xi = linspace(-1,1,n);
%     x = linspace(-1,1,1000);
%     
%     if 0
%         % Create Lagrange polynomials
%         for j =1:n
%             yi = zeros(n,1);
%             yi(j) = 1; % L3
%             
%             % lagrange
%             y =lagrange(xi,yi,x);
%             plot(x,y,'Linewidth',2,'Displayname','lagrange');
%         end
%     end
%     
%     %==========================
%     % Test Example
%     yi = [3 2 2 1 0 -3 -4 1 2 4]; % for n=10
%     
%     %plot
%     plot(xi, yi, 'o','MarkerSize',10,'MarkerFaceColor','r','MarkerEdgeColor','k')
%     hold on
%     
%     % lagrange
%     y =lagrange(xi,yi,x);
%     plot(x,y,'Linewidth',2,'Displayname','lagrange');
%     
%     % linear
%     y = interp1(xi,yi,x);
%     plot(x,y,'b','Linewidth',2,'Displayname','linear')
%     
%     % spline
%     y = interp1(xi,yi,x,'spline');
%     plot(x,y,'g','Linewidth',2,'Displayname','in-built cubic spline')
%     
%     legend
%     ax = gca;
%     ax.FontSize = 16;
% end
