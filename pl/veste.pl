%     Arquivo: veste.pl
%
% Prof. Ausberto S. Castro Vera
% Disciplina : Paradigmas de Ling. de Programacao
% UENF-CCT-LCMAT-CC
% Date: 15/set/2021
% Aluno: Alysson de Jesus Alcantara Alves
%-------------------------------------------------

%  Fonte:  http://www.facom.ufu.br/~marcelo/PL/tutorial%20de%20prolog.pdf

% Aqui come�a o programa     ...
pessoa(ale).       %           Alexandra
pessoa(babe).      %           Barbara
pessoa(rosa).
cor(azul).
cor(amarelo).
cor(vermelho).
cor(lilaz).
cor(verde).

% este peda�o � importante...pois....est�
% dito no problema  e defineuma cor paracada  menina


tem_uma_cor(babe,amarelo).
tem_uma_cor(rosa,verde).
tem_uma_cor(ale,azul).

%% aqui  pode-se ampliar as restri��es
nao_pode_vestir(babe,verde).
nao_pode_vestir(rosa,azul).
nao_pode_vestir(rosa,lilaz).

veste(X, Cor1, Cor2):- pessoa(X), cor(Cor1), cor(Cor2), tem_uma_cor(X,Cor1),
      \+(nao_pode_vestir(X,Cor2)),                /* � um fato que deve ser negado */
      Cor1 \== Cor2 ,                             /*C1 diferente de C2 */
      /* n�o  pode ter amarelo e  vermelho com  C1  e  C2  e  vice-versa           */
      \+(
         ((Cor1  = vermelho), /*C1 tem  que ser diferente de Vermelho           */
         (Cor2   = amarelo))                                                       /* idem para   amarelo....  */
;                                                                                                                                                                                                                                                             /*                      ;           ou           */
         ((Cor1 =  amarelo) ,                      /*,e ... ocontr�rio  */
         (Cor2  =  vermelho))
).

coresVestimentas :- veste(X,C1,C2), write(X), write(' ====> '), write(C1), write('.. e ..'), write(C2), nl,
          fail.
          ache_tudo.


