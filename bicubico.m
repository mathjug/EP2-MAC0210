function [coefs] = bicubico (matriz, indices, h)
  % recebida a matriz N x N e os índices necessários (matriz 4x2), retorna matriz 4x4 com os 16 coeficientes
  
  for i = 1:2 % encontra o valores da funcao nos pontos necessarios
    for j = 1:2
      matriz1(i, j) = matriz(indices(2*i + j - 2, 1), indices(2*i + j - 2, 2));
    endfor
  endfor
  
  for i = 1:2 % encontra os valores das derivadas parciais em relacao a y
    for j = 1:2
      matriz2(i, j) = aprox_derivada_y(matriz, indices(2*i + j - 2, 1), indices(2*i + j - 2, 2), h);
    endfor
  endfor
  
  for i = 1:2 % encontra os valores das derivadas parciais em relacao a x
    for j = 1:2
      matriz3(i, j) = aprox_derivada_x(matriz, indices(2*i + j - 2, 1), indices(2*i + j - 2, 2), h);
    endfor
  endfor

  for i = 1:2 % encontra os valores das derivadas parciais duplas em relacao a x e y
    for j = 1:2
      matriz4(i, j) = aprox_derivada_dupla(matriz, indices(2*i + j - 2, 1), indices(2*i + j - 2, 2), h);
    endfor
  endfor
          
  B = [1,0,0,0;
       1,h,h**2,h**3;
       0,1,0,0;
       0,1,2*h,3*(h**2)];
  F = [matriz1, matriz2; matriz3, matriz4]; 
  coefs = inv(B) * F * inv(B');
endfunction