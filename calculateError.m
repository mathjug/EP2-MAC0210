function [erro] = calculateError (originalImg, decompressedImg)
  % função que, recebendo uma imagem original e a interpolada dela, calcula o erro
  orig = imread (originalImg);
  desc = imread (decompressedImg);
  p_final = rows(desc);
  
  for i = 1:3 % percorre as 3 dimensoes
    subtracao = orig(1:p_final, 1:p_final, i) - desc(1:p_final, 1:p_final, i);
    original = orig(1:p_final, 1:p_final, i);
    subtracao = subtracao(:); % transforma matriz em vetor
    original = original(:);
    soma1 = sqrt(sum(subtracao .** 2)); % raiz quadrada da soma dos quadrados dos elementos da matriz
    soma2 = sqrt(sum(original .** 2));
    erros(i,1) = soma1 / soma2;
  endfor
  
  erro = sum(erros) / 3;
  disp(erro)
endfunction