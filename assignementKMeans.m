%Return M x N distance matrix
%given listPts (Nxd) and centres (Mxd)
function nc = assignementKMeans(listPts, centres)
    nc = -2 .* centres * listPts' + listPts.^2 + centres.^2;


end