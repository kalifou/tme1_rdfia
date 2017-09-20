
function sift=computeSIFT(s,Ig,Ior,Mg)
    
    % R : matrix of samples over the whole picture I
    
    % s =16
    % ig = 16 *16
    
    %sift = 0;
    %sig = 0.5 * width;
    %H = H + G * M;
    H += times(Ig,Mg);
    return H;
end
    