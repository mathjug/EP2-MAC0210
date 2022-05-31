function [compressedImg] = compress (originalImg, k)
  % função que, recebendo uma imagem, faz a sua compressão
  original = imread (originalImg); % original é uma matriz PxPx3
  [p p cores] = size(original);
  manter = [];
  compressedImg = "compressed.png";
  
  for i = 1:p
    if (rem(i - 1, k + 1) == 0)
      manter = horzcat(manter,[i]);
    endif
  endfor
  
  if (cores > 1)
    compressed = original(manter, manter,:);
  else
    compressed = original(manter, manter);
  endif
  
  imwrite (compressed, compressedImg);
  
endfunction