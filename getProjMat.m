function [ projMat ] = getProjMat( vec1, vec2 )
%getProjMat returns transformation (projection) matrix so that projMat * x
% is a projection of x onto vec1, vec2 plane. The assumption is that vec1 and
% vec2 are vector columns and are of the same size
% the return value is matrix, which rows are coordinates of our new
% orthogonal basis in old basis
%   usage of projMat: vec_column_in_new = projMat * vec_column_in_old
%       vec_column_in_old = inv(projMat) * vec_column_in_new
    moe = 1e-16; % margin of error
    spaceSize = size(vec1);
    spaceSize = spaceSize(1);
    projMat = zeros(spaceSize, spaceSize + 2);
    oldBasisMat = eye(spaceSize);
    projMat(:, 1) = vec1 ./ norm(vec1);
    projMat(:, 2) = vec2 - dot(vec2, projMat(:, 1)) * projMat(:, 1);
    projMat(:, 2) = projMat(:, 2) ./ norm(projMat(:, 2));
    for (i = 1:spaceSize)
        eCur = oldBasisMat(:, i);
        prevVectors = projMat(:, 1:(i + 1));
        dotMat = repmat(dot(repmat(eCur, 1, i + 1), prevVectors),...
            spaceSize, 1); %this is a coefficient matrix 
        projMat(:, i + 2) = eCur - sum(dotMat .* prevVectors, 2);
        if (abs(norm(projMat(:, i + 2))) >= moe) % non-zero norm
            projMat(:, i + 2) = projMat(:, i + 2) ./ norm(projMat(:, i + 2));
        end;
    end;
    projMat(:, ~any(projMat, 1)) = []; % remove clean zeroes
    projMat(:, spaceSize + 1:end) = []; % remove dependant vectors
    projMat = projMat';
end

