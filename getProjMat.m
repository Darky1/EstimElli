function [ projMat, transMat ] = getProjMat( vec1, vec2 )
%getProjMat returns transformation and projection matrices so that projMat * x
% is a projection of x onto vec1, vec2 plane. The assumption is that vec1 and
% vec2 are vector columns and are of the same size
% the transformation matrix is a matrix, which rows are coordinates of our new
% orthogonal basis in old basis
%   usage of transMat: vec_column_in_new = transMat * vec_column_in_old
%       vec_column_in_old = inv(transMat) * vec_column_in_new
%   usage of projMat: vec_column_projection = projMat * vec_column_in_full
%       vec_column_in_full = inv(transmat) * [vec_column_projection;
%       zeros(spaceSize - 2, 1)]
    moe = 1e-16; % margin of error
    spaceSize = size(vec1);
    spaceSize = spaceSize(1);
    transMat = zeros(spaceSize, spaceSize + 2);
    oldBasisMat = eye(spaceSize);
    transMat(:, 1) = vec1 ./ norm(vec1);
    transMat(:, 2) = vec2 - dot(vec2, transMat(:, 1)) * transMat(:, 1);
    transMat(:, 2) = transMat(:, 2) ./ norm(transMat(:, 2));
    for (i = 1:spaceSize)
        eCur = oldBasisMat(:, i);
        prevVectors = transMat(:, 1:(i + 1));
        dotMat = repmat(dot(repmat(eCur, 1, i + 1), prevVectors),...
            spaceSize, 1); %this is a coefficient matrix 
        transMat(:, i + 2) = eCur - sum(dotMat .* prevVectors, 2);
        if (abs(norm(transMat(:, i + 2))) >= moe) % non-zero norm
            transMat(:, i + 2) = transMat(:, i + 2) ./ norm(transMat(:, i + 2));
        end;
    end;
    transMat(:, ~any(transMat, 1)) = []; % remove clean zeroes
    transMat(:, spaceSize + 1:end) = []; % remove dependant vectors
    transMat = transMat'; % a transformation matrix
    projMat = transMat(1:2, :);% a projection matrix
end

