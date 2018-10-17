function [ projMat ] = getProjMat( vec1, vec2 )
%getProjMat returns transformation (projection) matrix so that projMat * x
% is a projection of x onto vec1, vec2 plane. The assumption is that vec1 and
% vec2 are vector columns and are of the same size
%  usage of projMat: vec_column_in_new = projMat * vec_column_in_old
    spaceSize = size(vec1);
    spaceSize = spaceSize(1);
% get basis
% g-s orthogonalization
% now, we make matrix, which columns are normalized coordinates of
% our new orthogonalized basis;
% the resulting matrix transposed is our projMat
%return

end

