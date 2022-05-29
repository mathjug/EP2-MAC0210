function coeficientes = bilinear (matriz, indices, h)
  % recebida a matriz N x N e os índices necessários, retorna matriz coluna com os 4 coeficientes
  
  for i = 1:4
   pontos(i, 1) = matriz(indices(i,1), indices(i,2));
  endfor
  
  matriz_h = [1,0,0,0; 1,0,h,0; 1,h,0,0; 1,h,h,h**2];
  inv_h = inv(matriz_h);
  coeficientes = inv_h * pontos;
endfunction