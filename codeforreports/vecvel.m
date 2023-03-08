function [v,a] = vecvel(xx,SAMPLING,TYPE)%------------------------------------------------------------%%  FUNCTION vecvel.m%  Calculation of eye velocity from position data%  Please cite: Engbert, R., & Kliegl, R. (2003) Microsaccades%  uncover the orientation of covert attention. Vision Research%  43: 1035-1045.%%  (Version 1.2, 01 JUL 05)% %   29/07/08 JPO modified for velocity computation with 9 and 17 seamples%   models ( taken from SRresearch ExperimentBuilder.chm manual (Models of Velocity%   and Accelerations Calculations).%-------------------------------------------------------------%%  INPUT:%%  xy(1:N,1:2)     raw data, x- and y-components of the time series%  SAMPLING        sampling rate (number of samples per second)%  TYPE            velocity type: TYPE=2 recommended%%  OUTPUT:%%  v(1:N,1:2)      velocity, x- and y-components%%-------------------------------------------------------------N = length(xx);            % length of the time seriesv = zeros(N,2);a = zeros(N,2);switch TYPE    case 1      % 3 samples model        v(2:N-1,:) = SAMPLING/2*[xx(3:end,:) - xx(1:end-2,:)];    case 2      % 5 samples model        v(3:N-2,:) = SAMPLING/6*[xx(5:end,:) + xx(4:end-1,:) - xx(2:end-3,:) - xx(1:end-4,:)];%         v(2,:) = SAMPLING/2*[xx(3,:) - xx(1,:)];%         v(N-1,:) = SAMPLING/2*[xx(end,:) - xx(end-2,:)];    case 3      % 9 samples model        v(5:N-4,:) = SAMPLING/18*[xx(9:end,:) + xx(8:end-1,:) + xx(7:end-2,:) - xx(3:end-6,:) - xx(2:end-7,:) - xx(1:end-8,:)];        a(5:N-4,:) = SAMPLING.^2/24*[xx(9:end,:) + xx(8:end-1,:) - xx(6:end-3,:) - 2.*xx(5:end-4,:) - xx(4:end-5,:) + xx(2:end-7,:) + xx(1:end-8,:)];    case 4      % 17 samples model        v(9:N-8,:) = SAMPLING/60*[xx(17:end,:) + xx(16:end-1,:) + xx(15:end-2,:) + xx(14:end-3,:) + xx(13:end-4,:) - xx(5:end-12,:) - xx(4:end-13,:) - xx(3:end-14,:) - xx(2:end-15,:) - xx(1:end-16,:)];end