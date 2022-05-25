
clear all;

%gerando sinal de sweep
%t = 0:1/1e3:10;%tempo de 10 segundos
%sinal = chirp(t,1,10,60,'logarithmic');

('Carregando dados...')%mensagem

%carregando o arquivo
sinal = load('C:\Users\LVI\Desktop\Sávyo\Sávyo\projects\FFT\input_sensor.txt');
%plot(sinal);

%entradas
div = input('digite a quantidade de divisões desejadas: ');%numero de divisões
vf = input('frequência máxima da rampa(Hz): ');%velocidade maxima da rampa
time_sample = input('tempo do ensaio(segundos): ');%tempo da coleta de dados


%vetor de plot da frequência(usado para plotar na frequência correta)
%fr = [1:div:vf];
fr = [];
for i=1:vf
    if length(fr)==0 | fr(end) < vf*60
        fr(i)=(vf/div)*i*60;   
    else
        fr(i) = vf*60;
    end
end


m = [];%matriz responsavel por salvar os dados separados
M = [];%matriz responsavel por salvar os dados no dominio da frequencia

N = length(sinal);%tamanho do sinal
n = round(N/div, 0);%tamanho dos vetores divididos

%variaveis de controle
a = 1;
for i=1:div %divisão do sinal
    
    aux = sinal(a:n*i);
    m(:,i) = aux;
   
    a = n*i+1;   
end

%plots dos sinais
%figure(1);
%plot(m);

%calculo das fft's
for i=1:div
    y = fft(m(:,i));
    b = abs(y/n);
    a = b(1:n/2+1);
    a(2:end-1) = 2*a(2:end-1);
    M(:,i) = a;
end

%vetor de frequência
fs = n/(time_sample/div); %(t(length(t))/div);
f = fs*(0:(n/2))/n;

%plots
figure(1);
axis([1, 360, 0, 2000, 0, 0.5]);
set(gca,'ytick',[])
xlabel('Frequency (Hz)', 'fontsize', 32);
ylabel('Velocity (RPM)', 'fontsize', 32);
zlabel('Amplitude', 'fontsize', 32);
Az = -30;
El = 72;
%axis([1,80,0, 0.2])

hold on;
for i=1:div%plotando cada coluna da matriz
    for j=1:length(M(:,i))
        hz(j)=fr(i);
  
    end
    plot3(f, hz, M(:,i));
    colormap winter;
    
end

