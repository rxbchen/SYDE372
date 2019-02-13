function [sample_vector] = generate_samples(mu,N,sigma)
%GENERATE_SAMPLES: creates a sample matrix using provided data
    R = chol(sigma);
    sample_vector = repmat(mu,N,1) + randn(N,2)*R;
end

