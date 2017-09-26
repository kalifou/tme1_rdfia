function [centers, error] = solutionKMeans(points, M)
    %Init centers randomly
    centers = randomSeed(points, M);
    
    it = 0;
    movecenters = 1;
    while(sum(movecenters) > 0)          
        %Compute MxN neighboor matrix 
        nc = assignementKMeans(points, centers);
        
        %Update centers
        [centers, error, movecenters] = miseAjourKMeans(points, centers, nc);
        it = it + 1
        sum(movecenters)
    end
end