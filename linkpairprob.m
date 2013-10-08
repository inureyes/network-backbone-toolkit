function [B p] = linkpairprob(NS,n,threshold,directed)
%LINKPAIRPROB         Joint probability of link pairs.
%   LINKPAIRPROB(NS,n) calculates the joint probability of n-link pairs of 
%   network series NS regardless of their location.
%   
%   LINKPAIRPROB(NS,n,threshold) calculates the joint probability of
%   n-link pairs regardless of their location and return the pairs bigger 
%   than threshold.
%
%   LINKPAIRPROB(NS,n,threshold,directed) calculates the joint probability
%   of n-link pairs of directed network series NS regardless of their
%   location (if directed = true). Default of directed is false.
%
%   Output:     B       Network backbones (struct containing matrix)
%               p       Occupation probability of network backbones
%               (vector)
%
%   See also NETWORKBACKBONES
%
%   Created Sep 18, 2012
%   This MATLAB code is ported from python version.
%   Jeongkyu Shin <inureyes@gmail.com>


    if nargin < 4
        directed = false;
    end
    if nargin < 3
        threshold = 0.0;
    end
    nLink = 0;
    nSize = length(NS{1});

    OverlappedNet = zeros(nSize);

    for i=1:length(NS)
        OverlappedNet = OverlappedNet | NS{i};
    end
    count = 0;
    for i=1:nSize
        for j=1:nSize
            if i ~= j && OverlappedNet(i,j) ~= 0.0
                if directed ~= false
                    nLink = nLink + 1;
                    link(:,:,nLink) = [i j];
                elseif j > i
                    nLink = nLink + 1;
                    link(:,:,nLink) = [i j];
                end
            end
        end
    end
    pairCombination = combnk(1:nLink,n);
    for i=1:length(pairCombination)
        prob = 0.0;
        for ni=1:length(NS)
            sw = true;
            for linktest=1:n
               if NS{ni}(link(1,1,pairCombination(i,linktest)),link(1,2,pairCombination(i,linktest))) == 0.0;
                   sw = false;
                   continue;
               end
            end
            if sw == true
                prob = prob + 1.0;
            end
        end
        prob = prob / length(NS);
        if prob ~= 0.0 && prob > threshold
            count = count + 1;
            B{count} = zeros(nSize);
            for linktest=1:n
               B{count}(link(1,1,pairCombination(i,linktest)),link(1,2,pairCombination(i,linktest))) = 1.0; 
            end
            p(count) = prob;
        end
    end
end
