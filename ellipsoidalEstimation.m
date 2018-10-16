function [ output_args ] = ellipsoidalEstimation(mode, tEst, vec1, vec2,...
    n, A, B, xVec, xMat, pVec, pMat)
% Main function that estimate reachability set using inner and outer 
%   ellipsoids. After that it project set onto plane, dynamic or static.
% List of parameters:
%   mode - mode of program:
%       "2d" - in this mode reach set at time tEst(1) (tEst(2) will be
%       ignored if exists!) is projected at plane (vec1, vec2).
%       "static3d" - in this mode a projection of reach tube is builded.
%       Projection onto plane (vec1, vec2), no good lines used. Time
%       interval is [tEst(1), tEst(2)]
%       "dynamic3d" - in this mode a projection of reach tube is builded.
%       Projection onto dynamic plane (vec1(t), vec2(t)) using good lines. 
%       Time interval is [tEst(1), tEst(2)]
%   tEst - estimation time, positive. Can contain 1 or 2 elements.
%   vec1, vec2 - vectors for projection plane.
%   n - parameter for splitting time interval for tube modes.
%   A, B, xVec, xMat - constant parameters, determing.
%       differential equation dx/dt = Ax + Bu with start set as ellipsoid
%       E(xVec, xMat). Make sure that all dimensions are OK.
%   pVec(t), pMat(t) - equation parameters, determing dynamic ellipsoid 
%       E(pVec(t), pMat(t)) for control limits.


end

