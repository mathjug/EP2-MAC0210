function [decompressedImg] = decompress (compressedImg, method, k, h)
  % função que, recebendo uma imagem comprimida, faz a sua descompressão
  compressed = imread (compressedImg); % compressed é uma matriz NxNx3
  n = rows(compressed);
  p = n + (n - 1) * k;
  img = nan(p, p, 3); % cria matriz PxPx3 com valores NaN
  for i = 1:n
    for j = 1:n
      printf("z(%d,%d) = %f\n", i, j, compressed(i,j));
    endfor
  endfor
  % imwrite (img = matrix PxPx3, filename = arquivo_de_output.img);
endfunction
