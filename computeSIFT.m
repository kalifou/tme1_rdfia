function sift=computeSIFT(s,Ig,Ior,Mg)
    %%Computes sift descriptor from a s(=16) pixel image patch, 
    %%having as input Ig (16x16 image with gradient norm), 
    %%Ior (16x16 image with gradient orientation), and Mg (16x16 Gaussian mask).
    
    %PART 2 --> Use of thersholding to ignore low gradient regions
    thr = 0.0001;
    
    % Init* of histogramms
    s_s = sqrt(s); % ss = sqrt(16) =4
    H =   zeros(s_s,s_s,8);
    
    % Creating 4*4 Block cells of pixels out of the 16*16 initial matrices
    N = s_s * ones(1,s_s); 
    Blocks_ig  = mat2cell(Ig,N,N);    
    Blocks_ior  = mat2cell(Ior,N,N);    
    Blocks_Mg  = mat2cell(Mg,N,N);   
    
    for i=1:4
        for j=1:4
            % Collecting related i,j block of 4*4 pixels for Ior,Mg & Ig
            block_ior = cell2mat( Blocks_ior(i,j));  
            block_ig = cell2mat( Blocks_ig(i,j));  
            block_Mg = cell2mat( Blocks_Mg(i,j)); 
            
            % Updating the Orientation Histogramms for each pixels of the
            % current (i,j) block
            for ii=1:16 % for every pixel (ii) )
                if block_ig(ii) == 0
                    continue
                end
                inter =  block_ig(ii) * block_Mg(ii);
                H( i,j,block_ior(ii)) = H( i,j,block_ior(ii)) + inter;
            end
            %{
            %Part 2 --> erase values for low gradient regions
            if (norm(squeeze(H(i,j,:))) < thr)
                a = 'hello'
                H(i,j,:) = 0;
            end  
   %}
        end
    end
    
    %Create descriptor
    sift = [H(:)];
    
    %L2 Normalization + Thresholding + Second L2 Norm
    sift = sift ./ norm(sift);
    sift = min(sift,0.2);
    sift = sift ./ norm(sift);

end
    