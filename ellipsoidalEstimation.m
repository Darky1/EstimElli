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
    sizeA = size(A);
    sizeB = size(B);
    sizeXMat = size(xMat);
    sizeXVec = size(xVec);
    sizePMat = size(pMat);
    sizePVec = size(pVec);
    % firstly, we have to assume that xVec and pVec are vector-columns
    if (min(sizeXVec) ~= 1)
        disp('xVec is not a vector!');
        return;
    end;
    if (min(sizePVec) ~= 1)
        disp('pVec is not a vector!');
        return;
    end;
    if (sizeXVec(1) == 1)
        xVec = xVec';
    end;
    if (sizePVec(1) == 1)
        pVec = pVec';
    end;
    sizeX = max(sizeXVec);
    sizeP = max(sizePVec);
    % matrix check (if square)
    if (sizeA(1) ~= sizeA(2))
        disp('A is not square!');
        return;
    end;
    if (sizeXMat(1) ~= sizeXMat(2))
        disp('xMat is not square!');
        return;
    end;
    if (sizePMat(1) ~= sizePMat(2))
        disp('pMat is not square!');
        return;
    end;
    % X dimension check
    if ( sizeX ~= sizeA(1))
        disp('Sizes of A and xVec do not agree!');
        return;
    end;
    if ( sizeX ~= sizeXMat(1))
        disp('Sizes of xMat and xVec do not agree!');
        return;
    end;
    % P dimension check
    if ( sizeP ~= sizePMat(1))
        disp('Sizes of pMat and pVec do not agree!');
        return;
    end;
    
    % matrix B dimension check
    if (sizeB(1) ~= sizeX)
        disp('Sizes of B and A do not agree!');
        return;
    end;
    if (sizeB(2) ~= sizeP)
        disp('Sizes of B and pVec do not agree!');
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

