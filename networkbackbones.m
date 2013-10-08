function [B p] = networkbackbones(NS,n,k,threshold,directed)
%NETWORKBACKBONES         Network backbones with n links.
%   NETWORKBACKBONES(NS,n) extracts n-link sized dynamical network backbones from
%   network series NS.
%
%   NETWORKBACKBONES(NS,n,k) extracts top-k n-link sized dynamical
%   network backbones from network series NS.
%
%   NETWORKBACKBONES(NS,n,[kmin kmin]) extracts top-(kmin~kmax) n-link sized dynamical
%   network backbones from network series NS.
%
%   NETWORKBACKBONES(NS,n,k,threshold) extracts top-k n-link sized dynamical
%   network backbones from network series NS with threshold occupation
%   probability.
%
%   NETWORKBACKBONES(NS,n,k,threshold,directed) extracts top-k n-link sized
%   dynamcial network backbones from network series NS with threshold
%   occupation probability from directed network. (if directed = true)
%
%   Output:     B       Network backbones (struct containing adjacency matrix)
%               p       Occupation probability of network backbones
%               (vector)
%
%   Example
%      [B p] = networkbackbones(NS,n)
%
%   See also LINKPAIRPROB
%
%   Created Sep 18, 2012
%   This MATLAB code is ported from python version.
%   Jeongkyu Shin <inureyes@gmail.com>

    if nargin < 5
        directed = false;
    end
    if nargin < 4
        threshold = 0.0;
    end
    if nargin < 3
        k = 20;
    end
    if nargin < 2
        n = 2;
    end
    
    [pattern, prob] = linkpairprob(NS, n, threshold, directed);
    [newP, index] = sort(prob,'descend');
    count = 0;
    if length(threshold) ~= 2
        k = [1 k(1)];
    end
    for i=k(1):min(k(2),length(pattern))
        count = count + 1;
        if directed == false
            B{count} = pattern{index(i)} | pattern{index(i)}'; 
        else
            B{count} = pattern{index(i)};
        end
        p(count) = prob(index(i));
    end
end    