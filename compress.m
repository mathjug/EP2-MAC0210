function [compressedImg] = compress (originalImg, k)
  % função que, recebendo uma imagem, faz a sua compressão
  original = imread (originalImg); % original é uma matriz PxPx3
  %disp(original)
  p = rows(original);
  manter = [];
  compressedImg = "compressed.png";
  
  for i = 1:p
    if (rem(i - 1, k + 1) == 0)
      manter = horzcat(manter,[i]);
    endif
  endfor
  
  compressed = original(manter,manter,:);
  imwrite (compressed, compressedImg);
  
endfunction