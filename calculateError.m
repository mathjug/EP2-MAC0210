function [erro] = calculateError (originalImg, decompressedImg)
  % função que, recebendo uma imagem original e a interpolada dela, calcula o erro
  orig = imread (originalImg);
  desc = imread (decompressedImg);
  p = rows(orig);
  erros = [0;0;0];
  
  for i = 1:3
    subtracao = orig(:,:,i) - desc(:,:,i);
    original = orig(:,:,i);
    subtracao = reshape(subtracao, p * p, 1);
    original = reshape(original, p * p, 1);
    soma1 = sqrt(sum(subtracao .** 2));
    soma2 = sqrt(sum(original .** 2));
    erros(i,1) = soma1 / soma2;
  endfor
  
  erro = sum(erros) / 3;
  disp(erro)
endfunction