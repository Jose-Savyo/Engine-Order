lines = 800;
cols = 100;

matrix = [[],[]];

%figure(1);
%hold on;

for r=1:lines
   for i=1:cols
        %plot3(r, i, MATRIX(r, i), '.');
        matrix(r,:) = MATRIX(r,:);
   end
end

%view(-45,65);
%colormap bone;
%hold off;

%figure(2);
%hold on;

%for i=1:cols
%    for j=1:length(MATRIX([1:lines],i))
%        hz(j)=fr(i);
  
%    end
%    plot3(f, hz, MATRIX(:,i));
%end

%axis([1, 500, 0, 3200, 0, 0.5]);
%view(-45,65);
%colormap bone;
%hold off;

%figure(3);
%hold on;

%for i=1:cols
%    for j=1:length(MATRIX([1:lines],i))
%        hz(j)=fr(i);
%  
%    end
%    plot3(f, hz, MATRIX(:,i));
%end

%axis([1, 500, 0, 3200, 0, 0.5]);
%view(-45,65);
%colormap bone;
%hold off;

figure(4);
matrix = matrix';
surf(matrix);
xlabel('Frequência (Hz)', 'fontsize', 14);
ylabel('Velocidade (Rpm)', 'fontsize', 14);
zlabel('Amplitude', 'fontsize', 14);
colormap(parula(5))
%axis([0, 330, 0, 50, 0, 500]);
view(0,90);
