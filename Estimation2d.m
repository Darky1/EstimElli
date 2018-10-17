function [ output_args ] = Estimation2d( precision, tEst, vec1, vec2, n, ...
    A, B, xVec, xMat, pVec, pMat )
%Estimation2d In this function reach set at time tEst(1) (tEst(2) will be
%       ignored if exists!) is projected at plane (vec1, vec2). 
% .  tEst - estimation time, positive.
%   vec1, vec2 - vectors for projection plane.
%   n - parameter for splitting time interval for tube modes.
%   A, B, xVec, xMat - constant parameters, determing.
%       differential equation dx/dt = Ax + Bu with start set as ellipsoid
%       E(xVec, xMat). Make sure that all dimensions are OK.
%   pVec(t), pMat(t) - equation parameters, determing dynamic ellipsoid 
%       E(pVec(t), pMat(t)) for control limits.

end

