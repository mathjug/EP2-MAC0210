function coeficientes = bilinear (pontos, h)
  matriz_h = [1,0,0,0; 1,0,h,0; 1,h,0,0; 1,h,h,h**2];
  inv_h = inv(matriz_h);
  coeficientes = inv_h * pontos;
endfunction