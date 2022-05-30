function [decompressedImg] = decompress (compressedImg, method, k, h)
  % função que, recebendo uma imagem comprimida, faz a sua descompressão
  compressed = imread (compressedImg); % compressed é uma matriz NxNx3
  compressed = double(compressed);
  
  n = rows(compressed);
  p = n + (n - 1) * k;
  img = zeros(p, p, 3); % cria matriz PxPx3 com valores NaN
  
  d = h/(k+1) %d é a distancia entre cada ponto e seu adjacente
  
  fr = compressed(:,:,1)
  fg = compressed(:,:,2)
  fb = compressed(:,:,3)
  fs = [fr; fg; fb];
  disp(fs);
  
  
  %retirar dps
  k = 1;
  
  x0 = 0;
  y0 = 0;
  
  for i = 1:n-1
    for j = 1:n-1
      %achar o polinomio para um quadrado    
      pontos = [i,j;i,j+1; i+1,j; i+1,j+1];
      coefs = bicubico(fr, pontos, h);     % tem que ser fs(k)

      %colocar na matriz pxp 
      lini = (((i-1)*k)+i);
      cini = (((j-1)*k)+j);
      % xi = x0 + i*h
      xi = x0 + i*h;
      yj = y0 + j*h;
      for a = lini:(i*k)+(i+1)
        for b = cini:(j*k)+(j+1)
          %calculo do polinomio no ponto (xi + (a-lini)*d, yi + (b-cini)*d)
          x = xi + (a-lini)*d;
          y = yj + (b-cini)*d;
          %p = p(x,y) 
          p = [1,(x-xi),(x-xi)**2,(x-xi)**3] * coefs * [1;(y-yj);(y-yj)**2;(y-yj)**3];
          img(a,b,k) = p;
        endfor
      endfor
        
    endfor
  endfor
  
  imwrite (img, "decompressed.png");
  
endfunction
