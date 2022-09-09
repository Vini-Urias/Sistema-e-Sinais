function [Eq] = ErroQuadratico(X,sd,id,rd)
% Esta função determina o erro quadrático
% entre a saída real e a saída do modelo.
% u - entrada real - Laboratório
% y - saída real - Laboratório
% t - tempo real - Laboratório
% X = [Km pm] - o que eu quero descobrir
% desejo estimar [ Km e pm ] que minimiza o Eq (erro)

global r beta
r = X(1);
beta = X(2);

%%% Saida do modelo

R0       = 0;
S0       = 499;
I0       = 1;
model    = sim("ModeloSIR.slx");
SdValues = model.logsout{1}.Values.Data;
IdValues = model.logsout{2}.Values.Data;
RdValues = model.logsout{3}.Values.Data;      

%%% Erro quadrático - comparar com os dados experimentais

Eq1 = sum((sd - SdValues).^2);   % cálculo do erro
Eq2 = sum((id - IdValues).^2);   % cálculo do erro
Eq3 = sum((rd - RdValues).^2);   % cálculo do erro

Eq = sum(Eq1 + Eq2 + Eq3);

end

