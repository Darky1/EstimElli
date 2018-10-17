function [ output_args ] = ellipsoidalEstimation(mode, precision, tEst, vec1, vec2,...
    n, A, B, xVec, xMat, pVec, pMat)
% Main function that estimate reachability set using inner and outer 
%   ellipsoids. After that it project set onto plane, dynamic or static.
% List of parameters:
%   mode - mode of program:
%       "2d" - in this mode reach set at time tEst(1) (tEst(2) will be
%       ignored if exists!) is projected at plane (vec1, vec2).
%       "static3d" - in this mode a projection of reach tube is builded.
%       Projection onto plane (vec1, vec2), no "good" lines used. Time
%       interval is [tEst(1), tEst(2)]
%       "dynamic3d" - in this mode a projection of reach tube is builded.
%       Projection onto  plane (vec1, vec2), changing dynamically so that "good" lines keep being tangent. 
%       Time interval is [tEst(1), tEst(2)]
%   precision ? parameter for splitting approximation directions
%   tEst - estimation time, positive. Can contain 1 or 2 elements.
%   vec1, vec2 - vectors for projection plane.
%   n - parameter for splitting time interval for tube modes.
%   A, B, xVec, xMat - constant parameters, determing.
%       differential equation dx/dt = Ax + Bu with start set as ellipsoid
%       E(xVec, xMat). Make sure that all dimensions are OK.
%   pVec(t), pMat(t) - equation parameters, determing dynamic ellipsoid 
%       E(pVec(t), pMat(t)) for control limits.
%   ellipsoidalEstimation(mode, tEst, vec1, vec2, n, A, B, xVec, xMat, pVec, pMat)    
    % dimension check
    sizeX = 0;
    sizeP = 0;
    [retVal, vec1, vec2, xVec, pVec, sizeX, sizeP] = dimensionCheck( vec1, vec2, A, B, xVec, xMat, pVec, pMat );
   % if it failed ? return without continuing
    if (retVal == false)
        return;
    end;
    % end of dimension check; sizeX is a size of coordinate space and sizeP
    % is a size of control space
    
    %mode check
    switch mode
        case {'2d'}
            tEst = tEst(1);
            %2d proj func
            Estimation2d( precision, tEst, vec1, vec2, n, ...
                A, B, xVec, xMat, pVec, pMat )
            disp('2d');
        case {'static3d'}
            disp('static3d');
            %static 3d proj func
        case {'dynamic3d'}
            disp('dynamic3d');
            %dynamic 3d 
        otherwise
            disp('Invalid mode!');
            return;
    end;
    %end of mode check
end

