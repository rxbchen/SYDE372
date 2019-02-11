function plot_stddev_contour(mu, angle, e_val, colour)
    % Plot Unit stddev contour/ellipse
    hold on;
    plot_ellipse(mu(1), mu(2), angle, sqrt(e_val(2,2)), sqrt(e_val(1,1)), colour);
end

