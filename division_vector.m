

div = 50;

sinal = t;

m = [];%matriz responsavel por salvar os dados separados
div_temp = [];%matriz responsavel por salvar os dados no dominio da frequencia

N = length(sinal);%tamanho do sinal
%div = round(N/2, 2);
n = round(N/div, 0);%tamanho dos vetores divididos

%variaveis de controle
a = 1;
for i=1:div %divisão do sinal
    
    aux = sinal(a:n*i);
    m(:,i) = aux;
   
    a = n*i+1;   
end

%guardando na matriz principal
for i=1:div

    div_temp(:,i) = m(:,i);
end