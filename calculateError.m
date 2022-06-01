function [erro] = calculateError (originalImg, decompressedImg)
  % função que, recebendo uma imagem original e a interpolada dela, calcula o erro
  orig = uint16(imread (originalImg));
  desc = uint16(imread (decompressedImg));
  [p_final p_final cores] = size(desc);
  
  for i = 1:cores % percorre as dimensoes
    if (cores > 1)
      subtracao = orig(1:p_final, 1:p_final, i) - desc(1:p_final, 1:p_final, i);
      original = orig(1:p_final, 1:p_final, i);
    else
      subtracao = orig(1:p_final, 1:p_final) - desc(1:p_final, 1:p_final);
      original = orig(1:p_final, 1:p_final);
    endif
    subtracao = subtracao(:); % transforma matriz em vetor
    original = original(:);
    soma1 = sqrt(sum(subtracao .** 2)); % raiz quadrada da soma dos quadrados dos elementos da matriz
    soma2 = sqrt(sum(original .** 2));
    erros(i,1) = soma1 / soma2;
  endfor
  
  erro = sum(erros) / 3;
  disp(erro)
endfunction