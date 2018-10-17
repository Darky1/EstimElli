function [ retVal, vec1, vec2, xVec, pVec, sizeX, sizeP ] = dimensionCheck( vec1, vec2, A, B,...
    xVec, xMat, pVec, pMat )
%dimensionCheck ? this function performs all the necesarry dimension checks
    retVal = true;
    sizeA = size(A);
    sizeB = size(B);
    sizeXMat = size(xMat);
    sizeXVec = size(xVec);
    sizePMat = size(pMat);
    sizePVec = size(pVec);
    sizeVec1 = size(vec1);
    sizeVec2 = size(vec2);
    % firstly, we have to assume that all vectors are vector-columns
    if (min(sizeXVec) ~= 1)
        disp('xVec is not a vector!');
        retVal = false;
    end;
    if (min(sizePVec) ~= 1)
        disp('pVec is not a vector!');
        retVal = false;
    end;
    if (min(sizeVec1) ~= 1)
        disp('vec1 is not a vector!');
        retVal = false;
    end;
    if (min(sizeVec2) ~= 1)
        disp('vec2 is not a vector!');
        retVal = false;
    end;
    if (sizeXVec(1) == 1)
        xVec = xVec';
    end;
    if (sizePVec(1) == 1)
        pVec = pVec';
    end;
    if (sizeVec1(1) == 1)
        vec1 = vec1';
    end;
    if (sizeVec2(1) == 1)
        vec2 = vec2';
    end;
    sizeX = max(sizeXVec);
    sizeP = max(sizePVec);
    sizeVec1 = max(sizeVec1);
    sizeVec2 = max(sizeVec2);
    % matrix check (if square)
    if (sizeA(1) ~= sizeA(2))
        disp('A is not square!');
        retVal = false;
    end;
    if (sizeXMat(1) ~= sizeXMat(2))
        disp('xMat is not square!');
        retVal = false;
    end;
    if (sizePMat(1) ~= sizePMat(2))
        disp('pMat is not square!');
        retVal = false;
    end;
    % X dimension check
    if ( sizeX ~= sizeA(1))
        disp('Sizes of A and xVec do not agree!');
        retVal = false;
    end;
    if ( sizeX ~= sizeXMat(1))
        disp('Sizes of xMat and xVec do not agree!');
        retVal = false;
    end;
    % P dimension check
    if ( sizeP ~= sizePMat(1))
        disp('Sizes of pMat and pVec do not agree!');
        retVal = false;
    end;

    % matrix B dimension check
    if (sizeB(1) ~= sizeX)
        disp('Sizes of B and A do not agree!');
        retVal = false;
    end;
    if (sizeB(2) ~= sizeP)
        disp('Sizes of B and pVec do not agree!');
        retVal = false;
    end;

    % vec1 and vec2 dimension checks
    if (sizeVec1 ~= sizeX)
        disp('Sizes of vec1 and xVec do not agree!');
        retVal = false;
    end;
    if (sizeVec2 ~= sizeX)
        disp('Sizes of vec2 and xVec do not agree!');
        retVal = false;
    end;
end

