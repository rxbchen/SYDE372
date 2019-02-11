function [e_val, e_vec, angle] = calc_stddev_contour(sigma)
    [e_vec, e_val] = eig(sigma);
    angle = atan(e_vec(1,2)/e_vec(1,1));
end
