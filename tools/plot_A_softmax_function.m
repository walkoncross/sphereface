theta = 0:1:180;

%legend_strings = {};

figure(1);
h = plot(theta, cosd(theta), '-b','LineWidth',2);
legend_strings = {'softmax(m=1)'};
ax_hanlders = [h];

hold on;
Fai = zeros(4,length(theta));

line_styles_0 = {'-g', '--g', ':g', '-.g', '-g'};
style_cnt = 1;

for m=[2 4]
    for k=0:m-1
        Fai(m,theta >= k * 180 / m & theta <= (k+1)*180/m) = (-1)^k * cosd(m*theta(theta >= k * 180 / m & theta <=(k+1)*180/m)) - 2 * k;
    end;
    
    legend_str = sprintf('large margin softmax(m=%d, \\lambda=0)', m);

    h = plot(theta, Fai(m,:), line_styles_0{style_cnt}, 'LineWidth',2);
    ax_hanlders(end+1) = h;
    legend_strings{end + 1, : } = legend_str;
    style_cnt = style_cnt + 1;
end;

%m=4;
%lambda=5;
%plot(theta, (cosd(theta) * lambda + Fai(4, :)) / (1 + lambda),'LineWidth',2, 'Color', 'r');

line_styles = {'-r', '--r', ':r', '-m', '--m', ':m'};
style_cnt = 1;
for m=[2 4]
    for lambda=1:2:5
        legend_str = sprintf('large margin softmax(m=%d, \\lambda=%d)', m, lambda);

        h = plot(theta, (cosd(theta) * lambda + Fai(m, :)) / (1 + lambda), line_styles{style_cnt}, 'LineWidth', 2);

        ax_hanlders(end+1) = h;
        legend_strings{end + 1, : } = legend_str;
        style_cnt = style_cnt + 1;
    end  
end
    
hold off;

%legend('softmax(m=1)','large margin softmax(m=2, \lambda=0)','large margin softmax(m=4, \lambda=0)', ['large margin softmax(m=4, \lambda=' num2str(lambda) ')']);
legend(ax_hanlders, legend_strings);
