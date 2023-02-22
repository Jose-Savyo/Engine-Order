
%clear all;
clc;

disp('Carregando dados...')%mensagem

%carregando o arquivo
%sinal = load('C:\Users\LVI\Desktop\Sávyo\Sávyo\projects\FFT\input_sensor.txt');
sinal = VarName1;
t = 40;%tempo do ensaio em segundos

dt = 40/100;

L = length(sinal);%tamanho do vetor do sinal
fs = L/t;%frequencia de amostragem do sinal
p = round(L/40, 0);

data = 1;%vetor que vai receber os dados tratados
ctrl = 1;%variavel de controle
bool = 0;%variavel de controle

for i=1:40
    
    for j=ctrl:p*i
        x = j-1;
        if x<=0
         x=1;
        end
      if sinal(j) == 0 | data(x)==1
        data(j) = 0;
        bool = 0;
      else
        data(j) = 1;
        bool = 1;
      end
    end
    ctrl = ctrl + 40;   
end   

data = data';

vf = [];%vetor de frequencia
ctrl = 1;%variavel de controle
for i=1:40
    cont = 0;%variavel de contagem dos pulsos
    for j=ctrl:p*i
        if data(j)==1
            cont = cont+1;
        end
    end
    vf(i)=round(cont/fs, 1);
    ctrl = ctrl + 40;  
end

vf = vf';
%plot da rampa
t = (0:40/40:40);%tempo
figure(1);
plot(t(1:length(vf)), vf, 'linewidth', 2);


