
%div = input('digite a quantidade de divisões desejadas: ');
div = 50;% numero de divisões, 50 divisões
% tempo de ensaio 40 segundos
% frequência máxima da rampa 50Hz

fr = [];
for i=1:50
    if length(fr)==0 | fr(end) < 50*60
        fr(i)=(50/div)*i*60;   
    else
        fr(i) = 50*60;
    end
end

%plots
figure(1);
%axis([1, 400, 0, 3200, 0, 0.5]);
%set(gca,'ytick',[])
xlabel('Frequency (Hz)', 'fontsize', 32);
ylabel('Velocity (RPM)', 'fontsize', 32);
zlabel('Amplitude', 'fontsize', 32);
%Az = -30;
%El = 72;
%axis([1,80,0, 0.2])

hold on;
for i=1:div%plotando cada coluna da matriz
    for j=1:length(MATRIX(:,i))
        pos(j)=rpm(i);
  
    end
    plot3(f, pos, MATRIX(:,i));
    colormap winter;
    
end