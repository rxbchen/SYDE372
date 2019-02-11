function [sample_vector] = sample_calc(mu,N,sigma)
%SAMPLE_CALC Summary of this function goes here
%   Detailed explanation goes here
    R = chol(sigma);
    sample_vector = repmat(mu,N,1) + randn(N,2)*R;
end

